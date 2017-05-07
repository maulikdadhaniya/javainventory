package com.minimouse.dao;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class HibernateUtilities {
	
	private static SessionFactory sessionFactory;
	private static StandardServiceRegistry standardServiceRegistry = null;
	static
	{
	    try
	    {
	        //Configuration configuration = new Configuration().configure();
	        standardServiceRegistry = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml")
	                                    .build();
	        Metadata metadata = new MetadataSources(standardServiceRegistry)
	                                .getMetadataBuilder().build();
	        sessionFactory = metadata.getSessionFactoryBuilder().build();

	    }catch(HibernateException exception)
	    {
	        System.out.println("problem creating session factory!");
	    }
	}

	public static SessionFactory getSessionFactory(){

	    return sessionFactory;
	}
}
