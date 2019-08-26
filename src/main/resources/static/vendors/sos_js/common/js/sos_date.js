// 문자열 날짜를 입력받아 Date 형의 객체를 구한다.
function gfd_getDate(sdate) {
    var arrDate = null;
    
    if(sdate.indexOf(".") > 0)
        arrDate = sdate.split(".");
    
    if(sdate.indexOf("-") > 0)
        arrDate = sdate.split("-");
    
    if(sdate.indexOf("/") > 0)
        arrDate = sdate.split("/");
    
    if(arrDate != null)
        sdate = arrDate.join("");
    
    year  = Number(sdate.substr(0,4));
    month = Number(sdate.substr(4,2));
    day   = Number(sdate.substr(6,2));
    
    return new Date(year, month - 1, day);
}

// Date형 날짜를 입력받아 문자열 날짜를 구한다.
function gfd_getSDate(date) {
    var year  = date.getFullYear();
    var month = date.getMonth() + 1;
    var day   = date.getDate();
    
    if (("" + month).length == 1) { month = "0" + month; }
    if (("" + day).length   == 1) { day   = "0" + day;   }
    
    return ("" + year + month + day);
}

// 문자열 날짜의 일 또는 월, 년도를 더하거나 뺀 날짜를 구한다.
function gfd_calDate(sdate, filter, add) {
    var date  = gfd_getDate(sdate);
    var year  = date.getFullYear();
    var month = date.getMonth();
    var day   = date.getDate();
    
    if(filter == "year")
        year += add;
    else if(filter == "month")
        month += add;
    else if(filter == "day")
        day += add;
    
    return gfd_getSDate(new Date(year, month, day));
}

// 문자열 날짜의 일 또는 월, 년도를 더하거나 뺀 날짜를 구함
function gfd_calDate2(syear, y, smonth, m, sday, d) {
    var date = new Date(Number(syear) + y, Number(smonth) + m - 1, Number(sday) + d);
    
    return gfd_getSDate(date);
}

// 두 날짜의 차이 구함
/*
function gfd_getDateDiff(sdate1, sdate2, filter){
    var mod = "";
    
    var diff  = gfd_getDate(sdate2) - gfd_getDate(sdate1);
    var day   = 24 * 60 * 60 * 1000;    // 일 만듬 : 시 * 분 * 초 * 밀리세컨
    var month = day * 30;               // 월 만듬 : 시 * 분 * 초 * 밀리세컨 * 30일
    var year  = month * 12;             // 년 만듬 : 시 * 분 * 초 * 밀리세컨 * 30일 * 12달
    
    if(filter == "year")
        mod = year;
    else if(filter == "month")
        mod = month;
    else if(filter == "day")
        mod = day;
    
    return parseInt(diff / mod, 10);
}
*/

//두 날짜의 년 차이 구함
function gfd_getYearDiff(sdate1, sdate2){
    var startDate = gfd_getDate(sdate1);
    var endDate   = gfd_getDate(sdate2);
     
    var yearDiff = endDate.getYear() - startDate.getYear();
    
    return yearDiff;
}

// 두 날짜의 월 차이 구함
function gfd_getMonthDiff(sdate1, sdate2){
    var startDate = gfd_getDate(sdate1);
    var endDate   = gfd_getDate(sdate2);
     
    var yearDiff  = endDate.getYear()  - startDate.getYear();
    var monthDiff = endDate.getMonth() - startDate.getMonth();
     
    var result = yearDiff*12 + monthDiff;
    
    return result;
}

// 오늘날짜를 구함
function gfd_todayStr() {
    var now   = new Date();
    
    var year  = now.getFullYear();
    var month = now.getMonth() + 1;
    var day   = now.getDate();
    
    month = month < 10 ? ("0" + month) : month.toString();
    day   = day   < 10 ? ("0" + day)   : day.toString();
    
    return (year.toString() + month + day);
}

// 문자열 날짜를 입력받아 요일을 구한다.
function gfd_getDayOfWeek(sdate) {
    var date = gfd_getDate(sdate);
    var day  = date.getDay();
    var week = new Array('일','월','화','수','목','금','토');
    
    return week[day];
}

// 문자열 날짜를 입력받아 요일의 숫자를 구한다.
function gfd_getDayIntOfWeek(sdate) {
    var date = gfd_getDate(sdate);
    var day  = date.getDay();
    
    return day;
}

// 문자열 날짜를 입력받아 해당 월의 마지막날짜를 구한다.
function gfd_getLastDay(sdate) {
    var date = gfd_getDate(sdate);
    
    return gfd_calDate2(date.getFullYear(), 0, date.getMonth() + 1, 1, "01", -1);
}

// date 형식으로 만들어 주기
function gfd_formatDate(){
    var args = gfd_formatDate.arguments;
    
    var val = args[0];
    
    if(val == null || val == ""){
        return "";
    } else {
        val = val.replace(/[^\d]/g, "");
        
        var prefix = args.length > 1 ? args[1] : ".";
        
        var mask = "";
        
        if(val.length == 6){    // 년-월
            mask = "9999" + prefix + "99";
        } else {                // 년-월-일
            mask = "9999" + prefix + "99" + prefix + "99";
        }
        
        return gf_toMask(val, mask);
    }
}

// 현재일자
function gfd_today(){
    var args = gfd_today.arguments;
    
    var prefix = args.length > 1 ? args[1] : ".";
    
    return gfd_formatDate(gfd_todayStr(prefix));
}

//현재시간
function gfd_currHour(){
    var date = new Date();
    
    var hour = date.getHours();
    
    return ""+(hour < 10 ? "0" + hour : hour);
}

//현재분
function gfd_currMin(){
    var date = new Date();
    
    var min = date.getMinutes();
    
    return ""+(min < 10 ? "0" + min : min);
}

//현재초
function gfd_currSec(){
    var date = new Date();
    
    var sec = date.getseconds();
    
    return ""+(sec < 10 ? "0" + sec : sec);
}

// 현재시간(시분초)
function gfd_currTime(){
    return gfd_currHour() + gfd_currMin() + gfd_currSec();
}

// 날짜 유효성 체크
/*
function gfd_isValidDate(param) {
    try {
        param = param.replace(/\./g, "");
        
        // 자리수가 맞지않을때
        if(isNaN(param) || param.length != 8) {
            return false;
        }
        
        var year  = Number(param.substring(0, 4));
        var month = Number(param.substring(4, 6));
        var day   = Number(param.substring(6, 8));
        
        var dd = day / 0;
        
        
        if(month < 1 || month > 12) {
            return false;
        }
        
        var maxDaysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
        var maxDay = maxDaysInMonth[month-1];
        
        // 윤년 체크
        if(month == 2 && ( year % 4 == 0 && year % 100 != 0 || year % 400 == 0)) {
            maxDay = 29;
        }
        
        if(day <= 0 || day > maxDay) {
            return false;
        }
        return true;
        
    } catch (err) {
        return false;
    }
}
*/