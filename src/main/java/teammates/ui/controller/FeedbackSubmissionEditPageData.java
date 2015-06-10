package teammates.ui.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import teammates.common.datatransfer.AccountAttributes;
import teammates.common.datatransfer.FeedbackSessionQuestionsBundle;
import teammates.common.datatransfer.InstructorAttributes;
import teammates.common.datatransfer.StudentAttributes;
import teammates.common.util.Const;
import teammates.common.util.StringHelper;
import teammates.common.util.Url;

public class FeedbackSubmissionEditPageData extends PageData {
    public FeedbackSessionQuestionsBundle bundle = null;
    public String moderatedQuestion = null;
    public boolean isSessionOpenForSubmission;
    public boolean isPreview;
    public boolean isModeration;
    public boolean isShowRealQuestionNumber;
    public boolean isHeaderHidden;
    public StudentAttributes studentToViewPageAs;
    public InstructorAttributes previewInstructor;    
    
    public FeedbackSubmissionEditPageData(AccountAttributes account, StudentAttributes student) {
        super(account, student);
        isPreview = false;
        isModeration = false;
        isShowRealQuestionNumber = false;
        isHeaderHidden = false;
    }
    
    public List<String> getRecipientOptionsForQuestion(String feedbackQuestionId, String currentlySelectedOption) {
        ArrayList<String> result = new ArrayList<String>();
        
        if (this.bundle == null) {
            return null;
        }
        
        Map<String, String> emailNamePair = this.bundle.getSortedRecipientList(feedbackQuestionId);
        
        // Add an empty option first.
        result.add(
            "<option value=\"\" " +
            (currentlySelectedOption == null ? "selected=\"selected\">" : ">") +
            "</option>"
        );
        
        for (Map.Entry<String, String> pair : emailNamePair.entrySet()) {
            result.add(
                "<option value=\"" + pair.getKey() + "\"" +
                (StringHelper.recoverFromSanitizedText(pair.getKey()).equals(currentlySelectedOption)  ? " selected=\"selected\"" : "") +
                ">" + sanitizeForHtml(pair.getValue()) + 
                "</option>"
            );
        }

        return result;
    }
    
    public boolean isPreview() {
        return isPreview;
    }
    
    public boolean isModeration() {
        return isModeration;
    }
    
    public boolean isHeaderHidden() {
        return isHeaderHidden;
    }
    
    public StudentAttributes getStudentToViewPageAs() {
        return studentToViewPageAs;
    }
    
    public String getSubmitAction() {
        return isModeration ? Const.ActionURIs.INSTRUCTOR_EDIT_STUDENT_FEEDBACK_SAVE
                            : Const.ActionURIs.STUDENT_FEEDBACK_SUBMISSION_EDIT_SAVE;
    }
    
    public boolean isSubmittable() {
        return isSessionOpenForSubmission || isModeration;
    }
    
    public String getRegistrationMessage() {
        String joinUrl = new Url(Const.ActionURIs.STUDENT_COURSE_JOIN_NEW)
                                 .withRegistrationKey(student.key)
                                 .withStudentEmail(student.email)
                                 .withCourseId(bundle.feedbackSession.courseId)
                                 .toString();

        return String.format(Const.StatusMessages.UNREGISTERED_STUDENT, student.name, joinUrl);
    }
    
    public FeedbackSessionQuestionsBundle getBundle() {
        return bundle;
    }
}
