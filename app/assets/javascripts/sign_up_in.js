//パスワード表示・非表示
$(function(){
    var pw = document.getElementById('password');
    var pwCheck = document.getElementById('password-check');
    pwCheck.addEventListener('change', function() {
        if(pwCheck.checked) {
            pw.setAttribute('type', 'text');
        } else {
            pw.setAttribute('type', 'password');
        }
    }, false);
})