/**
 * Copyright (c) 2024, WSO2 LLC. (https://www.wso2.com).
 *
 * WSO2 LLC. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package io.ballerinax.iso8583;

import io.ballerinax.iso8583.util.ISO8583Constant;
import net.minidev.json.JSONObject;

import org.jpos.iso.ISOException;
import org.jpos.iso.ISOMsg;
import org.jpos.iso.packager.GenericPackager;



/**
 * ISO8583 Parser.
 * <p>
 * This class is used to parse the ISO8583 message and transform it to an XML.
 */
public class ISO8583Parser {

    private static GenericPackager packager;

    /**
     * Unpack the ISO message and transform to an XML.
     *
     * @param message ISO message.
     * @return Json string of the iso message.
     */
    public static String unpackISOmessage(String message) throws ISO8583Exception {

        ISOMsg isoMsg = new ISOMsg();
        isoMsg.setPackager(getIsoPackager());
        try {
            isoMsg.unpack(message.getBytes());
        } catch (ISOException e) {
            throw new ISO8583Exception("Error occurred while unpacking the ISO message", e);
        }
        return messageBuilder(isoMsg);
    }

    /**
     * messageBuilder is used to build the json iso messages.
     *
     * @param isomsg iso fields.
     * @return Json string of the iso message.
     * @throws ISO8583Exception if an unknown field id is found.
     */
    private static String messageBuilder(ISOMsg isomsg) throws ISO8583Exception {

        JSONObject payloadJson = new JSONObject();
        for (int i = 0; i <= isomsg.getMaxField(); i++) {
            if (isomsg.hasField(i)) {
                String dataElement = ISO8583Constant.iso8583idNames.get(String.valueOf(i));
                String value = isomsg.getString(i);
                if (dataElement != null) {
                    payloadJson.put(dataElement, value);
                } else {
                    throw new ISO8583Exception("Unknown ISO8583 field id: " + i);
                }
            }
        }
        return payloadJson.toJSONString();
    }

    private static GenericPackager getIsoPackager() throws ISO8583Exception {

        if (packager == null) {
            try {
                ClassLoader loader = Thread.currentThread().getContextClassLoader();
                packager = new GenericPackager(loader.getResourceAsStream(ISO8583Constant.PACKAGER_V_87));
            } catch (ISOException e) {
                throw new ISO8583Exception("Error occurred while loading the packager file", e);
            }
        }
        return packager;
    }
}
