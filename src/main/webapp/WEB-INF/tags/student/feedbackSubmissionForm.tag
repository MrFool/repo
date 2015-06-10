<%@ tag description="Student feedback submission form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/student" prefix="ts" %>
<%@ tag import="teammates.common.util.Const" %>
<form method="post" name="form_student_submit_response" action="${submitAction}">
    <ts:feedbackSubmissionEditQuestionsAndResponses>
    </ts:feedbackSubmissionEditQuestionsAndResponses>
    <div class="bold align-center">
        <c:if test="data.moderation">
            <input name="moderatedstudent" value="<c:out value='data.studentToViewPageAs.email' />" type="hidden">
        </c:if>
        <c:choose>
            <c:when test="${empty data.bundle.questionResponseBundle}">
                There are no questions for you to answer here!
            </c:when>
            <c:when test="${data.preview || not submittable}">
                <input disabled="disabled" type="submit" class="btn btn-primary" id="response_submit_button" data-toggle="tooltip" data-placement="top" title="<%= Const.Tooltips.FEEDBACK_SESSION_EDIT_SAVE %>" value="Submit Feedback" style="background: #66727A;">
            </c:when>
            <c:otherwise>
                <input type="submit" class="btn btn-primary" id="response_submit_button" data-toggle="tooltip" data-placement="top" title="<%= Const.Tooltips.FEEDBACK_SESSION_EDIT_SAVE %>" value="Submit Feedback">
            </c:otherwise>
        </c:choose>
    </div>
    <br>
    <br>
</form>