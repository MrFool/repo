<%@ tag description="Body footer (bottom of page)" %>
<%@ attribute name="version" required="true" %>
<div id="footerComponent" class="container-fluid">
    <div class="container">
        <div class="row">
            <div class="col-md-2">
                <span>[<a href="/index.html">TEAMMATES</a> V${version}]</span>
            </div>
            <div class="col-md-8">
                [for <span class="highlight-white">${data.account.institute}</span>]
            </div>
            <div class="col-md-2">
                <span>[Send <a class="link" href="../contact.html" target="_blank">Feedback</a>]</span>
            </div>
        </div>
    </div>
</div>