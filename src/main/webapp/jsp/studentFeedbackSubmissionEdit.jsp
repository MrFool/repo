<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/student" prefix="ts" %>
<c:set var="jsIncludes">
    <script type="text/javascript" src="/js/feedbackSubmissionsEdit.js"></script>
    <script type="text/javascript" src="/js/student.js"></script>
</c:set>
<ts:studentPageFeedbackSessions pageTitle="TEAMMATES - Submit Feedback" bodyTitle="Submit Feedback" jsIncludes="${jsIncludes}">
    <ts:registrationMessage />
    <ts:feedbackSubmissionForm />
</ts:studentPageFeedbackSessions>