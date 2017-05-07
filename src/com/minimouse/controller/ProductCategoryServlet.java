package com.minimouse.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.minimouse.dao.ProductCategoryService;
import com.minimouse.model.ProductCategory;
@WebServlet("/ProductCategoryServlet")
public class ProductCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
/*	
	// location to store file uploaded
    private static final String UPLOAD_DIRECTORY = "lawCategoryServicePics";
 
    // upload settings
	 private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
	 private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
	 private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
*/
	ProductCategory objPc = new ProductCategory();
	ProductCategoryService objPcs = new ProductCategoryService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		
		String f = request.getParameter("flag");
		
		ProductCategory pId = objPcs.selectById(id);
		if(f.equals("edit"))
		{
			request.getSession().setAttribute("hdnProdCategory", pId); 				 //Edit 
		}
		else if(f.equals("delete")){
			objPcs.delete(pId);												//Delete
		}
			response.sendRedirect("ProductCategory.jsp");
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		/*if (!ServletFileUpload.isMultipartContent(request)) {
            // if not, we stop here
            PrintWriter writer = response.getWriter();
            writer.println("Error: Form must has enctype=multipart/form-data.");
            writer.flush();
            return;
		}
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(MEMORY_THRESHOLD);
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setFileSizeMax(MAX_FILE_SIZE);
        upload.setSizeMax(MAX_REQUEST_SIZE);
        String uploadPath = getServletContext().getRealPath("")+ File.separator + UPLOAD_DIRECTORY;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
		
		
        try {
        	List<FileItem> formItems = upload.parseRequest(request);
            if (formItems != null && formItems.size() > 0) {
            	String filePath = null;
            	String flag = null;
            	for (FileItem item : formItems) {
            		if (!item.isFormField()) {
            			String fileName = new File(item.getName()).getName();
            			objPc.setImage(UPLOAD_DIRECTORY+"/"+fileName);
                        filePath = uploadPath + File.separator + fileName;
                        File storeFile = new File(filePath);
                        item.write(storeFile);
            		}
            		else{
            			
            			if(item.getFieldName().equals("txtTitle")){
    						//objProfile.setArtistId(Integer.parseInt(item.getString()));
    						//System.out.println(Integer.parseInt(item.getString()));
            				objPc.setTitle(item.getString());
            			}
            			if(item.getFieldName().equals("txtDescription")){
    						//objProfile.setArtistId(Integer.parseInt(item.getString()));
    						//System.out.println(Integer.parseInt(item.getString()));
            				objPc.setDescription(item.getString());
            			}
    					
            		}
            	}
            }
            objPcs.insert(objPc);
		} catch (Exception e) {
			e.printStackTrace();
		}
        response.sendRedirect("ProductCategory.jsp");
	}
}
*/
		
	ProductCategory p = (ProductCategory) request.getSession().getAttribute("hdnProdCategory");
		
		if(p!=null)
		{
			if(objPcs != null){
			request.getSession().removeAttribute("hdnProdCategory");
			p.setTitle(request.getParameter("txtTitle"));
			p.setDescription(request.getParameter("txtDescription"));
			objPcs.update(p);
		}
		}
		else
		{																//insert
		objPc = new ProductCategory();	
		objPc.setTitle(request.getParameter("txtTitle"));
		objPc.setDescription(request.getParameter("txtDescription"));
		objPc.setStatus("A");
		objPcs.insert(objPc);
		
		//objPcs.addEmployee("Zara", "Ali", 1000);
		}
		response.sendRedirect("ProductCategory.jsp");
	}
}
