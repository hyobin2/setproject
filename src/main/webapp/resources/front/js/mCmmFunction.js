function captchaRefresh(){
    $("#captchaImg").attr("src", "/captcha?ran=" + Math.random());
}


