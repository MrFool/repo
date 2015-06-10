<%@ tag description="Student Page registration message for non registered students" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${data.account.googleId == null}">
    <div id="registerMessage" class="alert alert-info">
       <c:out value="${data.registrationMessage }" />
    </div>
</c:if>