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

/**
 * ISO8583 Exception.
 *
 * Throws if errors occurred during the ISO8583 message parsing process.
 */
public class ISO8583Exception extends Exception {

    public ISO8583Exception(String s) {
        super(s);
    }

    public ISO8583Exception(String s, Throwable throwable) {
        super(s, throwable);
    }
}
