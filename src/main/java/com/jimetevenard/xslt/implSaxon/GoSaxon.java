package com.jimetevenard.xslt.implSaxon;

import java.io.File;
import java.io.IOException;
import java.util.Map.Entry;

import javax.xml.transform.Source;
import javax.xml.transform.stream.StreamSource;

import org.xmlresolver.Resolver;

import com.jimetevenard.xslt.utils.ConfigMap;
import com.jimetevenard.xslt.utils.GenerateXslUtils;
import com.jimetevenard.xslt.utils.IntermediateXdm;
import com.jimetevenard.xslt.utils.ParamsMap;

import net.sf.saxon.s9api.Destination;
import net.sf.saxon.s9api.DocumentBuilder;
import net.sf.saxon.s9api.Processor;
import net.sf.saxon.s9api.QName;
import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.XPathCompiler;
import net.sf.saxon.s9api.XdmItem;
import net.sf.saxon.s9api.XdmNode;
import net.sf.saxon.s9api.XsltCompiler;
import net.sf.saxon.s9api.XsltExecutable;
import net.sf.saxon.s9api.XsltTransformer;

/**
 * Utility class to perfom as saxon XSLT
 * 
 * @author ext-jetevenard
 *
 */
public class GoSaxon {

	/*
	 * TODO ====
	 * 
	 * En l'état, cette classe ne sert pas à grand chose... Elle a vocation à
	 * simplifier, mais cette histoire de config map et tout, c'est vraiment
	 * plus simple ?
	 * 
	 * Passer en Singleton
	 * 
	 * 
	 * Créer une méthode pour chaque step :
	 * 
	 * La premiere pour générer l'intermediate avec l'XsltTransformer déjà
	 * instancié sur generate.xsl -
	 * 
	 * La deuxième pour faire tourner l'intermediate
	 * 
	 */

	private static final QName IT_SAXON_QNAME = new QName(GenerateXslUtils.INTERMIDIATE_INITAL_TEMPLATE);

	private Processor proc;
	private XsltCompiler compiler;
	private XPathCompiler xPathCompiler;
	private DocumentBuilder docBuilder;

	private XsltExecutable generateXsltExecutable;
	private XsltTransformer generalXsltTransfomrer;
	private boolean ready = false;

	private XdmItem paramsContextItem;

	public XdmItem getParamsContextItem() {
		return paramsContextItem;
	}

	public void setParamsContextItem(XdmItem paramsContextItem) {
		this.paramsContextItem = paramsContextItem;
	}

	public GoSaxon(String catalogPath, boolean useLicensedSaxonEdition) {
		try {
			SaxonProcessorHolder.setLicensed(useLicensedSaxonEdition);
			proc = SaxonProcessorHolder.getInstance().getProcessor();
			compiler = proc.newXsltCompiler();
			xPathCompiler = proc.newXPathCompiler();
			docBuilder = proc.newDocumentBuilder();

			StreamSource generateXslStream = new StreamSource(GenerateXslUtils.generateXslAsStream());
			generateXslStream.setSystemId(GenerateXslUtils.generateXslPath());
			generateXsltExecutable = compiler.compile(generateXslStream);
			generalXsltTransfomrer = generateXsltExecutable.load();

			System.setProperty("xml.catalog.files", catalogPath);
			Resolver resolver = new Resolver();
			compiler.setURIResolver(resolver);

			ready = true;
		} catch (SaxonApiException e) {
			// TODO Auto-generated catch block
			// TODO il faudrait la thrower pour la traiter ailleurs
			e.printStackTrace();
		}
	}

	public void generateIntermediate(ConfigMap config) throws SaxonApiException, IOException {
		generateIntermediate(config, null);
	}

	public void generateIntermediate(ConfigMap config, IntermediateXdm intermediateXdm)
			throws SaxonApiException, IOException {

		checkState();

		XdmNode doc = docBuilder.build(new File(config.get(ConfigMap.SOURCE_PATH)));
		generalXsltTransfomrer.setSource(doc.asSource());

		String fileOutput = config.get(ConfigMap.OUTPUT_PATH);

		if (fileOutput != null && !(fileOutput.isEmpty())) {
			generalXsltTransfomrer.setDestination(fileDestination(fileOutput));
		} else if (intermediateXdm != null) {
			generalXsltTransfomrer.setDestination(intermediateXdm.getDestination());
		} else {
			throw new IllegalArgumentException(
					"You must provide either a file path or a com.jimetevenard.xslt.utils.IntermediateXdm to hold the intermediate-xsl.");
		}

		// pas de params...

		generalXsltTransfomrer.transform();

	}

	public void executeIntermediate(ConfigMap config, ParamsMap params) throws SaxonApiException, IOException {

		executeIntermediate(config, params, null);
	}

	public void executeIntermediate(ConfigMap config, ParamsMap params, IntermediateXdm intermediateXdm)
			throws SaxonApiException, IOException {

		checkState();

		Source intermediateXSL;
		if (config.get(ConfigMap.XSL_PATH) != null && !(config.get(ConfigMap.XSL_PATH).isEmpty())) {
			intermediateXSL = new StreamSource(new File(config.get(ConfigMap.XSL_PATH)));
		} else if (intermediateXdm != null) {
			intermediateXSL = intermediateXdm.getSource();
		} else {
			throw new IllegalArgumentException(
					"You must provide either a file path or a com.jimetevenard.xslt.utils.IntermediateXdm that holds the intermediate-xsl.");
		}

		if (paramsContextItem == null) {
			paramsContextItem = docBuilder.build(intermediateXSL);
		}

		XsltExecutable intermediateXsltExecutable = compiler.compile(intermediateXSL);
		XsltTransformer intermediateXsltTransfomrer = intermediateXsltExecutable.load();

		String fileOutput = config.get(ConfigMap.OUTPUT_PATH);
		if (fileOutput != null && !(fileOutput.isEmpty())) {
			intermediateXsltTransfomrer.setDestination(fileDestination(fileOutput));
		}

		if (params != null) {
			for (Entry<javax.xml.namespace.QName, String> e : params.entrySet()) {
				intermediateXsltTransfomrer.setParameter(new QName(e.getKey()),
						xPathCompiler.evaluate(e.getValue(), paramsContextItem));
			}
		}

		intermediateXsltTransfomrer.setInitialTemplate(IT_SAXON_QNAME);

		intermediateXsltTransfomrer.transform();

	}

	private void checkState() {
		if (!ready) {
			throw new IllegalStateException("GoSaxon did not instanciate properly");
		}
	}

	private Destination fileDestination(String path) throws IOException {
		File out = new File(path);
		if (!out.getParentFile().exists()) {
			out.getParentFile().mkdirs();
		}
		out.createNewFile();
		return proc.newSerializer(out);
	}

}
