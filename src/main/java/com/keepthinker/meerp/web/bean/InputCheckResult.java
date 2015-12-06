package com.keepthinker.meerp.web.bean;

public class InputCheckResult {
	private InputStatus status;
	private String statusText;
	public InputStatus getStatus() {
		return status;
	}	
	public void setStatus(InputStatus status) {
		this.status = status;
	}
	public String getStatusText() {
		return statusText;
	}
	public void setStatusText(String statusText) {
		this.statusText = statusText;
	}
	@Override
	public String toString() {
		return "InputCheckResult [status=" + status + ", statusText="
				+ statusText + "]";
	}

}

