/**
 * Copyright (c), Andrew Fawcett, inc
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification, 
 *   are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice, 
 *      this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright notice, 
 *      this list of conditions and the following disclaimer in the documentation 
 *      and/or other materials provided with the distribution.
 * - Neither the name of the Andrew Fawcett, inc nor the names of its contributors 
 *      may be used to endorse or promote products derived from this software without 
 *      specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
 *  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
 *  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL 
 *  THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
 *  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 *  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 *  OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 *  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**/

/**
 * Wrapper around the LittleBits.cc Cloud API 
 *   http://developer.littlebitscloud.cc/preview
 **/
public class LittleBits {

	public String AccessToken {get; private set;}

	/**
	 * Uses Access Token from Custom Setting
	 **/
	public LittleBits() {
		this(LittleBitsAPI__c.getInstance().AccessToken__c);
	}
	/**
	 * Access token is available under Settings at http://control.littlebitscloud.cc/
	 **/
	public LittleBits(String accessToken) {
		this.AccessToken = accessToken;
	}

	/**
	 * Returns the default Device as per the Custom Setting
	 **/
	public Device getDevice() {
		return new Device(AccessToken);
	}

	/**
	 * Device ID is available under Settings at http://control.littlebitscloud.cc/
	 **/
	public Device getDevice(String deviceId) {
		return new Device(AccessToken, deviceId);
	}	

	public class Device {

		/** 
		 * Id of this Device 
		 **/
		public String Id {get; private set;}

		private String accessToken;

		/**
		 * Constructs the default device as per the custom setting 
		 **/
		private Device(String accessToken) {
			this(accessToken, LittleBitsAPI__c.getInstance().DeviceID__c);
		}

		/**
		 * Constructs a Device for the given Id
		 **/
		private Device(String accessToken, String deviceId) {
			this.Id = deviceId;
			this.accessToken = accessToken;
		}				

		/**
		 * By default maximum amplitude is sent for 3 seconds
		 **/
		public void output() {
			output(null, null);
		}

		/**
		 * Passing 10 and 10000, outputs 10% amplitude for 10 seconds
		 **/
		public void output(Integer percent, Integer durationMs) {
  			Http h = new Http();
        	HttpRequest request = new HttpRequest();
        	request.setEndpoint('https://api-http.littlebitscloud.cc/devices/'+Id+'/output');
        	request.setHeader('Authorization', 'Bearer ' + accessToken);
        	request.setHeader('Accept', 'application/vnd.littlebits.v2+json');
        	request.setMethod('POST');
        	if(percent!=null && durationMs!=null)
        	{
        		Map<String, Object> parameters = new Map<String, Object>();
        		parameters.put('percent', percent);
        		parameters.put('duration_ms', durationMs);
        		request.setBody(JSON.serialize(parameters));
        	}
        	HttpResponse response = h.send(request);
        	if(response.getStatusCode()!=200)
        		throw new LittleBitsException(response.getBody());
		}
	}

	public class LittleBitsException extends Exception { }
}