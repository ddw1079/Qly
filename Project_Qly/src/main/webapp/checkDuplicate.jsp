<%@ page import="java.sql.*, javax.naming.*, javax.sql.*" %>
<%
  String userId = request.getParameter("userId");
  boolean isDuplicate = false;

  try {
    Context initContext = new InitialContext();
    DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/qly");
    Connection conn = ds.getConnection();
    
    String sql = "SELECT COUNT(*) FROM USERS WHERE USER_ID = ?";
    PreparedStatement ps = conn.prepareStatement(sql);
    ps.setString(1, userId);
    
    ResultSet rs = ps.executeQuery();
    if (rs.next()) {
      isDuplicate = rs.getInt(1) > 0;
    }

    rs.close();
    ps.close();
    conn.close();
  } catch (Exception e) {
    e.printStackTrace();
    out.print("error");
    return;
  }

  out.print(isDuplicate ? "duplicate" : "ok");
%>
