package controller.enrollment;

import java.io.IOException;
import java.util.*;
import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.PMF;
import controller.Security;
import model.entity.Enrollment;

@SuppressWarnings("serial")
public class EnrollmentControllerIndex extends HttpServlet {

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			if(Security.garantyAccess(req.getServletPath(), pm)){
				throw new Exception("Su usuario no tiene permisos suficientes.");
			}
			String query = "select from "+Enrollment.class.getName()+" order by student";
			List<Enrollment> res = (List<Enrollment>) pm.newQuery(query).execute();
			req.setAttribute("showFull",res);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/Views/Enrollments/viewFull.jsp");
			rd.forward(req, resp);
		} catch (Exception e) {
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/Views/Errors/error.jsp");
			req.setAttribute("message",e.getMessage());
			rd.forward(req, resp);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}