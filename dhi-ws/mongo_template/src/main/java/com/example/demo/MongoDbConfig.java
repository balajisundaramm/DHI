package com.example.demo;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.config.AbstractMongoConfiguration;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;

import com.mongodb.Mongo;
import com.mongodb.MongoClient;
@EnableMongoRepositories(basePackages = "org.baeldung.repository")
@Configuration
public class MongoDbConfig extends AbstractMongoConfiguration{

	@Override
	protected String getDatabaseName() {
		// TODO Auto-generated method stub
		return "test";
	}

	@Override
	public Mongo mongo() throws Exception {
		// TODO Auto-generated method stub
		return new MongoClient("localhost", 27017);
	}
	
	/* @Override
	    protected String getMappingBasePackage() {
	        return "localhost";
	    }
*/
}
