package com.jimetevenard.xslt.api;

import com.jimetevenard.xslt.utils.ParamsMap;

public class GenerationScenario {

	private String name;
	private ParamsMap params;
	private String targetXslPath;
	private String sourceXslPath;

	public GenerationScenario(String name, ParamsMap params, String targetXslPath, String sourceXslPath) {
		super();
		this.name = name;
		this.params = params;
		this.targetXslPath = targetXslPath;
		this.sourceXslPath = sourceXslPath;
	}

	public GenerationScenario() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ParamsMap getParams() {
		return params;
	}

	public void setParams(ParamsMap params) {
		this.params = params;
	}

	public String getTargetXslPath() {
		return targetXslPath;
	}

	public void setTargetXslPath(String targetXslPath) {
		this.targetXslPath = targetXslPath;
	}

	public String getSourceXslPath() {
		return sourceXslPath;
	}

	public void setSourceXslPath(String sourceXslPath) {
		this.sourceXslPath = sourceXslPath;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((params == null) ? 0 : params.hashCode());
		result = prime * result + ((sourceXslPath == null) ? 0 : sourceXslPath.hashCode());
		result = prime * result + ((targetXslPath == null) ? 0 : targetXslPath.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		GenerationScenario other = (GenerationScenario) obj;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (params == null) {
			if (other.params != null)
				return false;
		} else if (!params.equals(other.params))
			return false;
		if (sourceXslPath == null) {
			if (other.sourceXslPath != null)
				return false;
		} else if (!sourceXslPath.equals(other.sourceXslPath))
			return false;
		if (targetXslPath == null) {
			if (other.targetXslPath != null)
				return false;
		} else if (!targetXslPath.equals(other.targetXslPath))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "\n\t * GenerationScenario [name=" + name + ", params=" + params + ", targetXslPath=" + targetXslPath
				+ ", sourceXslPath=" + sourceXslPath + "]\n";
	}

	

}
