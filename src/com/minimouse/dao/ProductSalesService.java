package com.minimouse.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.transform.Transformers;
import org.hibernate.type.StandardBasicTypes;

import com.minimouse.model.InvoiceFormBean;
import com.minimouse.model.ProductCategory;
import com.minimouse.model.ProductSubCategory;
import com.minimouse.model.StockOutTxn;

public class ProductSalesService {
	SessionFactory factory = HibernateUtilities.getSessionFactory();//new Configuration().configure().buildSessionFactory();
	
	public void insert(StockOutTxn StockOutTxn) {											//insert
		try {
			Session s = factory.openSession();
			Transaction t = s.beginTransaction();
			s.save(StockOutTxn);
			t.commit();
			s.close();
		} catch (Exception e) {
			e.printStackTrace();
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

	public InvoiceFormBean getInvoiceDetailByInvoiceId (int invoiceId){
		
		InvoiceFormBean invoice = null;
		List<InvoiceFormBean> invoiceLst = new ArrayList<InvoiceFormBean>();
		try {
			Session s = factory.openSession();
			Transaction tr = s.beginTransaction();
			
			StringBuilder  varname1 = new StringBuilder();
			varname1.append("select stOut.stockOutId as invoiceNo, stOut.quantity as quantity, stOut.createdDate as invoiceDate, ");
			varname1.append("stOut.soPrice as total, product.title as productName, category.title as productCategory, ");
			varname1.append("client.mobileNumber as mobileNumber, client.firstName as firstName, client.lastName as lastName, ");
			varname1.append("product.price as priceOfOneQnty ");
			varname1.append("from StockOutTxn stOut, AddClient client, ProductSubCategory product, ProductCategory category ");
			varname1.append("where stOut.stockOutId ='");
			varname1.append(invoiceId);
			varname1.append("' and stOut.productId = product.id and stOut.clientId = client.id ");
			varname1.append("and product.category = category.id ;");
					
			invoiceLst = (List<InvoiceFormBean>) s.createSQLQuery(varname1.toString())
						.addScalar("invoiceNo",StandardBasicTypes.INTEGER )
						.addScalar("quantity",StandardBasicTypes.INTEGER )
						.addScalar("invoiceDate",StandardBasicTypes.DATE )
						.addScalar("total",StandardBasicTypes.INTEGER )
						.addScalar("productName",StandardBasicTypes.STRING )
						.addScalar("productCategory",StandardBasicTypes.STRING )
						.addScalar("mobileNumber",StandardBasicTypes.LONG )
						.addScalar("firstName",StandardBasicTypes.STRING )
						.addScalar("lastName",StandardBasicTypes.STRING )
						.addScalar("priceOfOneQnty",StandardBasicTypes.INTEGER )
						.setResultTransformer(Transformers.aliasToBean(InvoiceFormBean.class)).list();
				
			if(invoiceLst!=null && !invoiceLst.isEmpty() && invoiceLst.size()>0){
				invoice = invoiceLst.get(0);
			}
			tr.commit();
			s.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	return invoice;
		
	}

	public List<InvoiceFormBean> getAllInvoiceDetail (){
		
		List<InvoiceFormBean> invoiceLst = new ArrayList<InvoiceFormBean>();
		try {
			Session s = factory.openSession();
			Transaction tr = s.beginTransaction();
			
			StringBuilder  varname1 = new StringBuilder();
			varname1.append("select stOut.stockOutId as invoiceNo, stOut.quantity as quantity, stOut.createdDate as invoiceDate, ");
			varname1.append("stOut.soPrice as total, product.title as productName, category.title as productCategory, ");
			varname1.append("client.mobileNumber as mobileNumber, client.firstName as firstName, client.lastName as lastName, ");
			varname1.append("product.price as priceOfOneQnty ");
			varname1.append("from StockOutTxn stOut, AddClient client, ProductSubCategory product, ProductCategory category ");
			varname1.append("where ");
			varname1.append(" stOut.productId = product.id and stOut.clientId = client.id ");
			varname1.append("and product.category = category.id order by stOut.createdDate ;");
					
			invoiceLst = (List<InvoiceFormBean>) s.createSQLQuery(varname1.toString())
						.addScalar("invoiceNo",StandardBasicTypes.INTEGER )
						.addScalar("quantity",StandardBasicTypes.INTEGER )
						.addScalar("invoiceDate",StandardBasicTypes.DATE )
						.addScalar("total",StandardBasicTypes.INTEGER )
						.addScalar("productName",StandardBasicTypes.STRING )
						.addScalar("productCategory",StandardBasicTypes.STRING )
						.addScalar("mobileNumber",StandardBasicTypes.LONG )
						.addScalar("firstName",StandardBasicTypes.STRING )
						.addScalar("lastName",StandardBasicTypes.STRING )
						.addScalar("priceOfOneQnty",StandardBasicTypes.INTEGER )
						.setResultTransformer(Transformers.aliasToBean(InvoiceFormBean.class)).list();
			
			tr.commit();
			s.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return invoiceLst;
		
	}
}
