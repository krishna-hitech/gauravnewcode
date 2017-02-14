/*
  * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.dts.project.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.dts.core.util.CoreHash;
import com.dts.core.util.CoreList;
import com.dts.crsm.dao.CategoryDAO;
import com.dts.crsm.dao.MedicineDAO;

/** 
 * MyEclipse Struts
 * Creation date: 12-24-2008
 * 
 * XDoclet definition:
 * @struts.action
 */
public class CustomerViewMedicine extends Action {
	/*
	 * Generated Methods
	 */

	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try{
			 MedicineDAO medicinedao = new MedicineDAO();
             CategoryDAO categorydao = new CategoryDAO();
           CoreList  aCoreList = medicinedao.listMedicine();
             CoreHash cCoreHash = categorydao.listCategoryNames();  
             if(!aCoreList.isEmpty())
          	{
            	 request.setAttribute("CoreList",aCoreList);
            	 request.setAttribute("CoreHash",cCoreHash);
            	 return mapping.findForward("ViewMedicine");
          	}
		}catch (Exception e) {
			// TODO: handle exception
		}return mapping.findForward("ViewMedicine");
	}
}