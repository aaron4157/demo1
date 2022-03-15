<p class="form-group ${invalid ? 'has-error' : ''}">
    <label class="control-label" style="${required?'color: red':''}" for="${property}">${required? '*' : '' } ${label}</label>
    <f:widget class="form-control" bean="${bean}" property="${property}" wrapper="default"/>
    <g:if test="${errors}">
        <g:each in="${errors}" var="error">
            <span class="help-block"><g:message error="${error}"/></span>
        </g:each>
    </g:if>
</p>