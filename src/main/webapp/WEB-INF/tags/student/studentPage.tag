<%@ tag description="Generic Student Page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/student" prefix="ts" %>
<%@ attribute name="pageTitle" required="true" %>
<%@ attribute name="jsIncludes" %>
<%@ attribute name="bodyTitle" required="true" %>
<t:page pageTitle="${pageTitle}" bodyTitle="${bodyTitle}">
    <jsp:attribute name="jsIncludes">
        ${jsIncludes}
    </jsp:attribute>
    <jsp:attribute name="navBar">
        <ts:navBar />
    </jsp:attribute>
    <jsp:body>
        <c:choose>
            <c:when test="${not data.headerHidden}">
                ${data.studentToViewPageAs.name}
                <%-- <jsp:include page="<%= Const.ViewURIs.STUDENT_HEADER %>" />
                <jsp:include page="<%= Const.ViewURIs.STUDENT_MOTD %>" /> --%>
            </c:when>
            <c:when test="${data.preview}">
                <nav class="navbar navbar-default navbar-fixed-top">
                    <h3 class="text-center">Previewing Session as Student ${data.studentToViewPageAs.name} (${data.studentToViewPageAs.email})</h3>
                </nav>
            </c:when>
            <c:when test="${data.moderation}">
                <nav class="navbar navbar-default navbar-fixed-top">
                    <h3 class="text-center">Moderating Responses for Student ${data.studentToViewPageAs.name} (${data.studentToViewPageAs.email})</h3>
                </nav>
            </c:when>
        </c:choose>
        <jsp:doBody />
    </jsp:body>
</t:page>