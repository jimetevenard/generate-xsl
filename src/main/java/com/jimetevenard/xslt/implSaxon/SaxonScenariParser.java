package com.jimetevenard.xslt.implSaxon;

import java.io.File;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashSet;
import java.util.Set;

import com.jimetevenard.xslt.GenerationScenario;
import com.jimetevenard.xslt.ScenariParser;
import com.jimetevenard.xslt.utils.ParamsMap;

import net.sf.saxon.s9api.DocumentBuilder;
import net.sf.saxon.s9api.Processor;
import net.sf.saxon.s9api.QName;
import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.XPathCompiler;
import net.sf.saxon.s9api.XPathExecutable;
import net.sf.saxon.s9api.XPathSelector;
import net.sf.saxon.s9api.XdmItem;
import net.sf.saxon.s9api.XdmNode;
import net.sf.saxon.s9api.XdmValue;

public class SaxonScenariParser extends ScenariParser {

	private Set<GenerationScenario> scenari = new HashSet<>();
	private File configurationScenariFile;
	private Processor processor;
	private DocumentBuilder builder;
	private XPathCompiler xPathCompiler;
	private XPathSelector allConfSelector;
	private XPathSelector nameSelector;
	private XPathSelector targetSelector;
	private XPathSelector sourceSelector;
	private XPathSelector paramsSelector;
	private XPathSelector paramNameSelector;
	private XPathSelector paramSelectSelector;
	private XdmNode scenariFileNode;

	

	public SaxonScenariParser(String confPath) {
		this.configurationScenariFile = new File(confPath);
	}

	public void parse() throws SaxonApiException, URISyntaxException {
		initSaxon();

		scenariFileNode = builder.build(configurationScenariFile);

		allConfSelector.setContextItem(scenariFileNode);
		XdmValue allScenari = allConfSelector.evaluate();
		constructScenari(allScenari);

	}

	public Set<GenerationScenario> getScenari() {
		return scenari;
	}
	
	public XdmNode getScenariFileNode() {
		return scenariFileNode;
	}

	private void initSaxon() throws SaxonApiException {
		SaxonProcessorHolder.setLicensed(Boolean.parseBoolean(System.getProperty(SaxonProcessorHolder.LICENCED_PROP)));
		processor = SaxonProcessorHolder.getInstance().getProcessor();
		builder = processor.newDocumentBuilder();
		xPathCompiler = processor.newXPathCompiler();

		allConfSelector = xPathCompiler.compile("/scenari/scenario").load();
		nameSelector = xPathCompiler.compile("normalize-space(@name)").load();

		targetSelector = xPathCompiler.compile("resolve-uri(normalize-space(target-xsl-path),base-uri(/))").load();
		sourceSelector = xPathCompiler.compile("resolve-uri(normalize-space(source-xsl-path),base-uri(/))").load();
		paramsSelector = xPathCompiler.compile("params/param").load();
		paramNameSelector = xPathCompiler.compile("string(@name)").load();
		paramSelectSelector = xPathCompiler.compile("string(@select)").load();
	}

	private String xdmUriToAbsolutePath(XdmValue xpathResult) throws URISyntaxException {
		return new File(new URI(xpathResult.toString())).getAbsolutePath();
	}

	private void constructScenari(XdmValue allScenari) throws SaxonApiException, URISyntaxException {
		for (XdmItem scenario : allScenari) {
			String name = getVal(nameSelector, scenario).toString();
			String target = xdmUriToAbsolutePath(getVal(targetSelector, scenario));
			String source = xdmUriToAbsolutePath(getVal(sourceSelector, scenario));

			ParamsMap paramsMap = constructParamMap(scenario);

			this.scenari.add(new GenerationScenario(name, paramsMap, target, source));
		}
	}

	private ParamsMap constructParamMap(XdmItem scenario) throws SaxonApiException {
		ParamsMap paramsMap = new ParamsMap();
		XdmValue params = getVal(paramsSelector, scenario);
		for (XdmItem param : params) {
			QName paramQName = new QName(getVal(paramNameSelector, param).toString(), (XdmNode) param);
			String paramSelect = getVal(paramSelectSelector, param).toString();
			paramsMap.put(paramQName.getStructuredQName().toJaxpQName(), paramSelect);
		}

		return paramsMap;
	}

	private XdmValue getVal(XPathSelector selector, XdmItem context) throws SaxonApiException {
		selector.setContextItem(context);
		return selector.evaluate();
	}

}
