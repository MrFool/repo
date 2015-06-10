<%@ tag description="Student feedback submission question and responses" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/student" prefix="ts" %>
<%@ tag import="teammates.common.util.Const" %>
<input type="hidden" name="<%= Const.ParamsNames.FEEDBACK_SESSION_NAME %>" value="<c:out value='${data.bundle.feedbackSession.feedbackSessionName}' />">
<input type="hidden" name="<%= Const.ParamsNames.COURSE_ID %>" value="<c:out value='${data.bundle.feedbackSession.courseId}' />">
<c:choose>
	<c:when test="${data.account.googleId != null})">
	   <input type="hidden" name="<%= Const.ParamsNames.USER_ID %>" value="<c:out value='${data.account.googleId}' />">
	</c:when>
	<c:otherwise>
	   <input type="hidden" name="<%= Const.ParamsNames.REGKEY %>" value="<c:out value='${data.student.key}' />">
       <input type="hidden" name="<%= Const.ParamsNames.STUDENT_EMAIL %>" value="<c:out value='${data.account.email}' />">
	</c:otherwise>
</c:choose>
<t:statusMessage />