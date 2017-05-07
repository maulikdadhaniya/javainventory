package com.minimouse.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.minimouse.model.ProductCategory;
import com.minimouse.model.ProductSubCategory;

public class ProductSubCategoryService {
	SessionFactory factory = HibernateUtilities.getSessionFactory();//new Configuration().configure().buildSessionFactory();
	
	public void insert(ProductSubCategory objSubPc) {											//insert
		 Session session = factory.openSession();
	      Transaction tx = null;
	      try{
	         tx = session.beginTransaction();
	         session.save(objSubPc);
	         tx.commit();
	      }catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      }finally {
	         session.close(); 
	      }
	}
	
	@SuppressWarnings("unchecked")
	public List<ProductSubCategory> selectAll(){									//select and display
		List<ProductSubCategory> list = null;
		try {
			Session s = factory.openSession();
			Transaction tr = s.beginTransaction();									
			Query qu = s.createQuery("from ProductSubCategory where status='A'");
			list = (ArrayList<ProductSubCategory>)qu.list();
			List<ProductCategory> listCat = this.selectAllCategory();
			if(list!=null && !list.isEmpty() && listCat!=null && !listCat.isEmpty()){
				for(ProductSubCategory ps:list){
					for(ProductCategory pc:listCat){
						if(ps.getCategory()==pc.getId()){
							ps.setCategoryDesc(pc.getTitle());
							break;
						}
					}
				}
			}
			tr.commit();
			s.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<ProductCategory> selectAllCategory(){									//select and display
		List<ProductCategory> list = null;
		try {
			Session s = factory.openSession();
			Transaction tr = s.beginTransaction();									
			Query qu = s.createQuery("from ProductCategory where status='A'");
			list = (ArrayList<ProductCategory>)qu.list();
			tr.commit();
			s.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	

	public ProductSubCategory selectById(int id){
		ProductSubCategory add = null;
			try {
				Session s = factory.openSession();
				Transaction tr = s.beginTransaction();
				Query qu = s.createQuery("from ProductSubCategory where id = "+id+"");
				add = (ProductSubCategory) qu.uniqueResult();
				tr.commit();
				s.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		return add;
	}
	
	public void delete(ProductSubCategory pc) {														//delete
		SessionFactory factory = new Configuration().configure().buildSessionFactory();
		Session s = factory.openSession();
		Transaction tr = s.beginTransaction();
		Query qu = s.createQuery("update ProductSubCategory set status='D' where id = "+pc.getId()+"");
		qu.executeUpdate();
		tr.commit();
		s.close();
	}
	
	public void update(ProductSubCategory p) {														//edit
		SessionFactory factory = new Configuration().configure().buildSessionFactory();
		Session s = factory.openSession();
		Transaction tr = s.beginTransaction();
		s.update(p);
		tr.commit();
		s.close();
	}


}
