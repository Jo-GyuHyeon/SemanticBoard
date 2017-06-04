function Check() {
    if (email.toemail.value.indexOf("@") + "" == "-1" ||
            email.toemail.value.indexOf(".") + "" == "-1" ||
            email.toemail.value == "") {
        alert("E-mail을 입력하세요.");
        email.toemail.focus();
        return false;
    }

    if (email.title.value.length < 1) {
        alert("글제목을 입력하세요.");
        email.title.focus();
        return false;
    }

    if (email.contents.value.length < 1) {
        alert("글내용을 입력하세요.");
        email.contents.focus();
        return false;
    }

    email.submit();
}

function list() {
    location.href = "listboard.jsp";
}
