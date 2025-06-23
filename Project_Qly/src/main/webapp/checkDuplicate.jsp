<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page contentType="text/plain; charset=UTF-8" %>

<%
    String userId = request.getParameter("userId");
    boolean isDuplicate = false;

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Context initContext = new InitialContext();
        Context envContext = (Context) initContext.lookup("java:/comp/env");
        DataSource ds = (DataSource) envContext.lookup("jdbc/qly");
        conn = ds.getConnection();

        String sql = "SELECT COUNT(*) FROM USERS WHERE USERID = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        rs = pstmt.executeQuery();

        if (rs.next() && rs.getInt(1) > 0) {
            isDuplicate = true;
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.print("error");
        return;
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception e) {}
        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }

    out.print(isDuplicate ? "duplicate" : "ok");
%>
