package com.gstarcad.website.search;

import java.io.File;
import java.io.IOException;

import org.apache.log4j.Logger;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.IndexWriterConfig.OpenMode;
import org.apache.lucene.index.Term;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.wltea.analyzer.lucene.IKAnalyzer;

/**
 * 
 * @ClassName: Indexer.java
 * @Description: 索引类
 * @author: fengzf fengzf@gstarcad.com
 * @Date: 2017年8月30日 下午4:34:13
 * @version V1.0
 */
public class Indexer{

	private static final Logger logger = Logger.getLogger(Indexer.class);

	private IndexWriter writer;

	public Indexer(String indexDir) throws IOException {

		File file = new File(indexDir);
		if (!file.exists()) {
			file.mkdirs();
		}
		Directory dir = FSDirectory.open(file);
		// 实例化IKAnalyzer分词器
		Analyzer analyzer = new IKAnalyzer();
		// 配置IndexWriterConfig
		IndexWriterConfig iwConfig = new IndexWriterConfig(Version.LUCENE_36,
				analyzer);
		iwConfig.setOpenMode(OpenMode.CREATE_OR_APPEND);
		writer = new IndexWriter(dir, iwConfig);
		logger.info("Luncene Indexer initialize ok...");
	}

	public void deleteIndexByType(String objectType) {
		try {
			writer.deleteDocuments(new Term(CoreDocument.OBJECT_TYPE,
					objectType));
			writer.commit();
		} catch (IOException e) {
			logger.error("deleteIndexByType index error", e);
		}
	}

	public void updateIndex(Document doc) throws Exception {
		writer.updateDocument(
				new Term(CoreDocument.OID, doc.get(CoreDocument.OID).toString()),
				doc);
	}

	public void deleteIndex(String oid) throws Exception {
		writer.deleteDocuments(new Term(CoreDocument.OID, oid));
	}

	public void addIndex(Document doc) throws CorruptIndexException,
			IOException, Exception {
		writer.addDocument(doc);
	}

	public void commit() throws CorruptIndexException, IOException {
		writer.commit();
	}

	public void close() throws CorruptIndexException, IOException {
		writer.close();
	}

}
