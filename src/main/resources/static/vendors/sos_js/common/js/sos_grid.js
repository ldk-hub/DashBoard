var DE_DATA_GRID_ID    = "dataGridList";    // List 영역을 묶는 DIV Tag ID
var DE_LIST_ALL_CHK    = "listChkAll";      // Grid 전체 CheckBox ID
var DE_LIST_CHK        = "listChk";         // Grid 선택 CheckBox ID
var DE_ADDROW_HTML_ID  = "addRowHtml"       // Grid Add Row HTML ID
var DE_ADDROW_LOCATION = "last";            // Grid Add Row Default Location

//Grid Make Html !!
function gf_makeListHtml(args){
    var targetId        = args.targetId == null || args.targetId == "" ? DE_DATA_GRID_ID : args.targetId;                            // Data List Target ID
    var appendYn        = args.appendYn == null || args.appendYn == "" ? "N" : "Y";                                                 // Data List 붙여넣기 여부[Y/N] : Default [N]
    var bodyHtml        = args.bodyHtml;                                                                                            // Data List HTML
    var pageInfo        = args.pageInfo;                                                                                            // Page Information
    var pageFunction    = args.pageFunction;                                                                                        // Page Link Function : Search Function !!
    var gridPageInfo    = args.gridPageInfo == null || args.gridPageInfo == "" ? "gridPageInfo" : args.gridPageInfo;                // Grid Page Index
    var gridPageSummary = args.gridPageSummary == null || args.gridPageSummary == "" ? "gridPageSummary" : args.gridPageSummary;    // Grid Page Summary    
    
    if(bodyHtml == ""){
        bodyHtml += '<tr>';
        bodyHtml += '    <td id="noResultList" colspan="' + $("#" + targetId + " col").length + '" style="text-align:center;">검색 결과가 없습니다.</td>';
        bodyHtml += '</tr>';
        
        $("#" + targetId + " tbody").html("");        
        $("#" + targetId + " tfoot").html(bodyHtml);
        
        // Grid Page Information !!
        $("#" + gridPageInfo).html("");    // Page Index !!
    } else {
        // Data List HTML Setting
        if(appendYn == "Y"){
            $("#" + targetId + " tbody").append(bodyHtml);
        } else {
            $("#" + targetId + " tbody").html(bodyHtml);
        }
        
        $("#" + targetId + " tfoot").html("");
        
        // Page Information HTML Setting
        if(pageInfo != null){
            gf_pageIndexHtml(pageInfo, pageFunction, gridPageInfo, gridPageSummary);    // Grid 하단 Page Info !!
        } else {
            gf_reSizeScrollTableTitle(targetId);
        }
    }
}

function gf_reSizeScrollTableTitle(targetId){
    if($("#" + targetId + "Div").hasVerticalScrollYn()){
        $("#" + targetId + "Title").css("width", $("#" + targetId).innerWidth());
    } else {
        $("#" + targetId + "Title").css("width", "100%");
    }
}

//가로 스크롤바 여부 체크
$.fn.hasHorizontalScrollYn = function() {
    return this.get(0) ? this.get(0).scrollWidth > this.innerWidth() : false;
}

// 세로 스크롤바 여부 체크
$.fn.hasVerticalScrollYn = function() {
    return this.get(0) ? this.get(0).scrollHeight > this.innerHeight() : false;
}

/*******************************************************
 * Make Page HTML !!
 * 
 * @param {string} targetId
 * @param {object} pageInfo
 * @param {string} pageFunction
 * @returns {string}
 * @description Make Page HTML
 *******************************************************/
function gf_pageIndexHtml(pageInfo, pageFunction, gridPageInfo, gridPageSummary){
    var pageInfoHtml = "";     // Page Index !!
    
    var totalCount = Number(pageInfo.totalCount); // 전제 개수 !!
    var currPageNo = Number(pageInfo.currPageNo); // 현재 페이지 !!
    var pageCount  = Number(pageInfo.pageCount);  // 한 페이지 개수
    var totalPage  = Number(pageInfo.totalPage);  // 전체 페이지 !!
    var blockCount = 10;                          // 한 블럭의 개수
    
    var strtNo = 0;     // 중간 BLOCK 처리 시작 NO
    var endNo  = 0;     // 중간 BLOCK 처리 끝 NO
    
    
    // Block Count !!
    var tempBlock       = totalPage % blockCount;
    var totalBlockCount = tempBlock == 0 ? totalPage / blockCount : Math.ceil(totalPage / blockCount);
    
    // 중간 BLOCK 처리부분 시작과 끝
    strtNo = Math.floor((currPageNo - 1) / blockCount) * blockCount + 1 ;
    endNo  = strtNo + blockCount;
    
    // 이전 10개 / 다음 10개
    var preBlockPage  = Math.floor(currPageNo / blockCount) * blockCount;
    var nextBlockPage = Math.ceil (currPageNo / blockCount) * blockCount + 1;
    
    // 다음 10개 한계치 구하기
    var endBlock = Math.ceil(Number(currPageNo) / blockCount);
    
    // [이전 10개] 처리
    if(currPageNo > 10){
        pageInfoHtml += '<a href="#" onClick="gf_searchPageList(' + preBlockPage + ',' + pageFunction + ');" class="btn btn_forward">이전 10 페이지 보기</a>';
    } else {
        pageInfoHtml += '<a href="#" class="btn btn_forward">이전 10 페이지 보기</a>';
    }
    
    // 이전페이지
    if(currPageNo > 1){
        pageInfoHtml += '<a href="#" onClick="gf_searchPageList(' + (Number(currPageNo) - 1) + ',' + pageFunction + ');" class="btn btn_prev">이전 페이지</a>';
    } else {
        pageInfoHtml += '<a href="#" class="btn btn_prev">이전 페이지</a>';
    }
    
    pageInfoHtml += '<ul>';
    
    // 중간 BLOCK 처리부분
    for(var i=strtNo; i<endNo; i++){
        if(i == currPageNo){
            //pageInfoHtml += '<li><a href="#" class="on">' + i + '</a></li>';
            pageInfoHtml += '<li><a href="#" class="pageOn">' + i + '</a></li>';
        } else {
            pageInfoHtml += '<li><a href="#" onClick="gf_searchPageList(' + i + ',' + pageFunction + ');">' + i + '</a></li>';
        }
        
        // 시작하려고 하는 페이지와 전체 페이지가 같을경우 그만!!!
        if(i == totalPage){
            break;
        }
    }
    
    pageInfoHtml += '</ul>';
    
    // 다음페이지
    if(currPageNo < totalPage){
        pageInfoHtml += '<a href="#" onClick="gf_searchPageList(' + (Number(currPageNo) + 1) + ',' + pageFunction + ');" class="btn btn_next">다음 페이지</a>';
    } else {
        pageInfoHtml += '<a href="#" class="btn btn_next">다음 페이지</a>';
    }
    
    // [다음 10개] 처리
    if(endBlock < totalBlockCount){
        pageInfoHtml += '<a href="#" onClick="gf_searchPageList(' + nextBlockPage + ',' + pageFunction + ');" class="btn btn_backward">다음 10페이지 보기</a>';
    } else {
        pageInfoHtml += '<a href="#" class="btn btn_backward">다음 10페이지 보기</a>';
    }
    
    // Grid Page Summary !!
    if($("#" + gridPageSummary).length > 0){
        var summary = 'Total Count : ' + totalCount + ' &nbsp;&nbsp;[ ' + currPageNo + ' / ' + totalPage + ' page ]';
        
        $("#" + gridPageSummary).html(summary);    // Page Summary !!
    }
    
    // Grid Page Information !!
    $("#" + gridPageInfo).html(pageInfoHtml);    // Page Index !!
}

/*******************************************************
 * Grid 두개로 나뉘어져 있고 검색결과가 없을 때 처리 !!
 * 
 * @param {string} opt
 * @param {string} div ID
 * @description 해당 div show/hide
 *******************************************************/
function gf_noResultListDivToggle(){
    var args = gf_noResultListDivToggle.arguments;
    
    var opt   = args[0];
    var divId = args.length > 1 ? args[1] : "noResultListDiv";
    
    $("div[id=" + divId + "]").each(function(){
        if(opt == "show"){
            $(this).show();
        } else {
            $(this).hide();
        }
    });
}

/*******************************************************
 * Page Link Function : Search Function !!
 * 
 * @param {int} pageNo
 * @param {string} pageFunction
 * @description 조회 function 호출
 *******************************************************/
function gf_searchPageList(pageNo, pageFunction){
    if(typeof(pageFunction) == "function") {
        pageFunction(pageNo);
    }
}

/*******************************************************
 * Grid 초기화 !!
 * @param {String} : listAreaId [Grid List Target ID]
 * @returns N/A
 * @description Grid 초기화
 *******************************************************/
function gf_initializeList(){
    var args = gf_initializeList.arguments;
    
    var targetId  = args.length > 0 ? args[0] != "" ? args[0] : DE_DATA_GRID_ID : DE_DATA_GRID_ID;
    
    var arrTargetId = targetId.split(",");
    
    for(var i=0; i<arrTargetId.length; i++){
        $("#" + arrTargetId[i] + " tbody").html("");
        
        if($("#" + arrTargetId[i] + " tfoot #noResultList").length == 1){
            $("#" + arrTargetId[i] + " tfoot tr").remove();
        }
    }
}

/*******************************************************
 * Grid Multiple Delete Row Check !!
 * @param {string} targetId : 행삭제 될 Target ID
 * @param {stirng} checkId  : checkbox ID
 * @returns {boolean}       : true/false
 * @description 다중 행삭제 체크
 *******************************************************/
function gf_checkingRows(){
    var args = gf_checkingRows.arguments;
    
    var targetId = args.length > 0 ? args[0] : DE_DATA_GRID_ID;
    var checkId  = args.length > 1 ? args[1] : DE_LIST_CHK;
    var checkMsg = args.length > 2 ? args[2] : "삭제";
    
    if(gf_getCheckBoxCnt(targetId, checkId) <= 0){
        alert(checkMsg + "할 데이터가 없습니다.");
        return false;
    }
    
    if(gf_getCheckedCnt(targetId, checkId) <= 0){
        alert("선택된 행이 없습니다.");
        return false;
    }
    
    return true;
}

/*******************************************************
 * Grid Checkbox All Count !!
 * @param {string} targetId : 행삭제 될 Target ID
 * @param {stirng} checkId  : checkbox ID
 * @returns {int}           : checkbox Count
 * @description 선택 영역에 체크박스의 전체 개수
 *******************************************************/
function gf_getCheckBoxCnt(){
    var args = gf_getCheckBoxCnt.arguments;
    
    var targetId = args.length > 0 ? args[0] != "" ? args[0] : DE_DATA_GRID_ID : DE_DATA_GRID_ID;
    var checkId  = args.length > 1 ? args[1] != "" ? args[1] : DE_LIST_CHK : DE_LIST_CHK;
    
    //return $("#" + targetId + " input:checkbox[id=" + checkId + "]").length;
    return $("#" + targetId + " input[id=" + checkId + "]").length;
}

/*******************************************************
 * Grid Checkbox Checked Count !!
 * @param {string} targetId : 행삭제 될 Target ID
 * @param {stirng} checkId  : input[checkbox or radio] ID
 * @returns {int}           : checked Count
 * @description 선택 영역에 선택 된 체크박스의 개수
 *******************************************************/
function gf_getCheckedCnt(){
    var args = gf_getCheckedCnt.arguments;
    
    var targetId = args.length > 0 ? args[0] != "" ? args[0] : DE_DATA_GRID_ID : DE_DATA_GRID_ID;
    var checkId  = args.length > 1 ? args[1] != "" ? args[1] : DE_LIST_CHK : DE_LIST_CHK;
    
    return $("#" + targetId + " input[id=" + checkId + "]:checked").length;
}

/*******************************************************
 * Grid Checked Row Index !!
 * 
 * @param {string} targetId : 행삭제 될 Target ID
 * @param {stirng} checkId  : input[checkbox or radio] ID
 * @returns {int}           : row Index
 * @description 선택 영역에 선택 된 Row Index
 *******************************************************/
function gf_getCheckedRowIdx(){
    var args = gf_getCheckedRowIdx.arguments;
    
    var targetId = args.length > 0 ? args[0] != "" ? args[0] : DE_DATA_GRID_ID : DE_DATA_GRID_ID;
    var checkId  = args.length > 1 ? args[1] != "" ? args[1] : DE_LIST_CHK : DE_LIST_CHK;
    
    var rowIdx = -1;
    
    $("#" + targetId + " input[id=" + checkId + "]").each(function(idx) {
        if($(this).is(":checked")){
            rowIdx = idx;
            
            return false;
        }
    });
    
    return rowIdx;
}

/*******************************************************
 * Grid Get Row Count !!
 * 
 * @param {string} listAreaId : 적용할 Grid List Area ID
 * @returns {int} row Count
 * @description Grid Get Row Count
 *******************************************************/
function gf_getRowCnt(){
    var args = gf_getRowCnt.arguments;
    
    var targetId = args.length > 0 ? args[0] != "" ? args[0] : DE_DATA_GRID_ID : DE_DATA_GRID_ID;
    var opt      = args.length > 1 ? args[1] != "" ? args[1] : "all" : "all";
    
    var rowIdx = -1;
    
    if($("#" + targetId + " tbody tr") != null){
        if(opt == "hide"){    // tr 숨김은 세지 않음
            $("#" + targetId + " tbody tr").each(function(){
                var trDisplay = $(this).css("display");
                
                if(trDisplay == "block" || trDisplay == ""){
                    rowIdx++;
                }
            });
        } else {
            rowIdx = $("#" + targetId + " tbody tr").length;
        }
    }
    
    return rowIdx;
}

/*******************************************************
 * Grid Get Current Text Data !!
 * 
 * @param {int} rowIdx : Grid Column Index
 * @param {int} colIdx : Grid Column Index
 * @param {string} listAreaId : 적용할 Grid List Area ID
 * @returns {int} Text
 * @description 선택된 행 Row Text 반환
 *******************************************************/
function gf_getGridText(rowIdx, colIdx, listAreaId){
    var targetId = listAreaId != null && listAreaId != "" ? listAreaId : DE_DATA_GRID_ID;
    
    return $.trim($("#" + targetId + " tbody tr:eq(" + rowIdx + ") td:eq(" + colIdx + ")").text());
}

function gf_setGridText(rowIdx, colIdx, listAreaId, val){
    var targetId = listAreaId != null && listAreaId != "" ? listAreaId : DE_DATA_GRID_ID;
    
    return $("#" + targetId + " tbody tr:eq(" + rowIdx + ") td:eq(" + colIdx + ")").text(val);
}

/*******************************************************
 * Grid Get Current Value Data !!
 * 
 * @param {int} rowIdx : Grid Column Index
 * @param {string} contId : Grid Control Box ID
 * @param {string} listAreaId : 적용할 Grid List Area ID
 * @returns {int} Value
 * @description 선택된 행 Row Value 반환
 *******************************************************/
function gf_getGridVal(rowIdx, contId, listAreaId){
    var targetId = listAreaId != null && listAreaId != "" ? listAreaId : DE_DATA_GRID_ID;
    
    return $.trim($("#" + targetId + " tbody tr input[id=" + contId + "]:eq(" + rowIdx + ")").val());
}

function gf_setGridVal(rowIdx, contId, listAreaId, val){
    var targetId = listAreaId != null && listAreaId != "" ? listAreaId : DE_DATA_GRID_ID;
    
    return $("#" + targetId + " tbody tr input[id=" + contId + "]:eq(" + rowIdx + ")").val(val);
}

/*******************************************************
 * Grid Select Row !!
 * 
 * @param {object} trObj    : 현재 선택한 tr의 Object
 * @param {string} targetId : 적용할 Grid Target ID
 * @returns N/A
 * @description 행 선택
 *******************************************************/
function gf_selectGridRow(){
    var args = gf_selectGridRow.arguments;
    
    var trObj    = args[0];
    var targetId = args.length > 1 ? args[1] != "" ? args[1] : DE_DATA_GRID_ID : DE_DATA_GRID_ID;
    
    gf_releaseGridRow(targetId);
    $(trObj).css("font-weight", "bold");
    $(trObj).css("background-color", "#FEF0F0");
}

/*******************************************************
 * Grid Release Row !!
 * 
 * @param {string} targetId : 적용할 Grid Target ID
 * @param {boolean} checkedOpt : 체크박스도 풀어줌
 * @returns N/A
 * @description 행 풀어주기
 *******************************************************/
function gf_releaseGridRow(){
    var args = gf_releaseGridRow.arguments;
    
    var targetId   = args.length > 0 ? args[0] != "" ? args[0] : DE_DATA_GRID_ID : DE_DATA_GRID_ID;
    var checkedOpt = args.length > 1 ? args[1] : false;
    
    $("#" + targetId + " tbody tr").each(function() {
        $(this).css("font-weight", "normal");
        $(this).css("background-color", "#FFFFFF");
        
        if(checkedOpt){
            $("input[type=radio]", this).each(function(){
                $(this).prop("checked", false);
            });
            
            $("input[type=checkbox]", this).each(function(){
                $(this).prop("checked", false);
            });
        }
    });
}

/*******************************************************
 * Grid Get Select Row !!
 * 
 * @param {string} listAreaId : 적용할 Grid List Area ID
 * @returns {int} row Index
 * @description 선택된 행 Row Index 반환
 *******************************************************/
function gf_getSelectRow(){
    var args = gf_getSelectRow.arguments;
    
    var targetId = args.length > 0 ? args[0] != "" ? args[0] : DE_DATA_GRID_ID : DE_DATA_GRID_ID;
    
    var rowIdx = -1;
    
    $("#" + targetId + " tbody tr").each(function(idx) {
        // 400 : normal, 700 : bold [ IE:700, Chrome:bold ]
        if($(this).css("font-weight") == "700" || $(this).css("font-weight") == "bold"){
            rowIdx = idx;
            return false;
        } 
    });
    
    return rowIdx;
}

/*******************************************************
 * Grid 전체 체크 및 해제 : CheckBox !!
 * 
 * @param {string}   : allChkId [전체 CheckBox ID]
 * @param {string}   : targetChkId [target CheckBox Object]
 * @description Grid 전체 체크 및 해제
 *******************************************************/
function gf_allListChk(){
    var args = gf_allListChk.arguments;
    
    var allChkId    = "";
    var targetChkId = "";
    
    if(args.length == 1){
        allChkId    = args[0] == null || args[0] == "" ? DE_LIST_ALL_CHK : args[0];
        targetChkId = allChkId.replace("All", "");
    } else if(args.length == 2){
        allChkId    = args[0] == null || args[0] == "" ? DE_LIST_ALL_CHK : args[0];
        targetChkId = args[1] == null || args[1] == "" ? DE_LIST_CHK     : args[1];
    }
    
    $("input[id=" + targetChkId + "]").each(function() {
        if(!$(this).is(":disabled")){
            $(this).prop("checked", $("#" + allChkId).is(":checked"));
        }
    });
}

/*******************************************************
 * Grid Checkbox Checked Key Parameter !!
 * @param {string} targetId : Target ID
 * @param {stirng} key      : Key ID
 * @param {stirng} checkId  : checkbox ID
 * @returns {string}        : parameter
 * @description 행의 Key를 parameter 형태로 반환 [a=1,2,3&b=4,5,6&...]
 *******************************************************/
function gf_deleteKeyParam(){
    var args = gf_deleteKeyParam.arguments;
    
    var targetId  = args.length > 0 ? args[0] != "" ? args[0] : DE_DATA_GRID_ID : DE_DATA_GRID_ID;
    var deleteKey = args.length > 1 ? args[1] : "";
    var checkId   = args.length > 2 ? args[2] != "" ? args[2] : DE_LIST_CHK : DE_LIST_CHK;
    var keyOpt    = args.length > 3 ? args[3] != "" ? args[3] : args[3] : "";
    
    if(deleteKey == ""){
        alert("두번째 인자값을 확인하세요 !!");
        return false;
    }
    
    var arrDeleteKey = deleteKey.split(",");
    
    var keyParam  = "";
    
    for(var i=0; i<arrDeleteKey.length; i++){
        var tempParam = "";
        
        $("#" + targetId + " tbody tr").each(function(trIdx) {
            if($("#" + targetId + " input[id=" + checkId + "]:eq(" + trIdx + ")").is(":checked")){
                var crudFlag = gf_getGridVal(trIdx, "crudFlag", targetId);
                var val      = gf_getGridVal(trIdx, arrDeleteKey[i], targetId);
                
                if(crudFlag == "C"){
                    gf_deleteRow(trIdx, targetId);
                } else {
                    if(val != ""){
                        tempParam += "|" + val;
                    }
                }
            }
        });
        
        if(tempParam != ""){
            keyParam += "&" + arrDeleteKey[i] + keyOpt + "=" + tempParam.substring(1);
        }
    }
    
    //if(keyParam == ""){
    //    gf_deleteRows(targetId, checkId);
    //}
    
    return keyParam != "" ? keyParam.substring(1) : "";
}


/*******************************************************
 * Grid Add Row !!
 * @param {string} targetId : 행추가 될 Target ID
 * @param {string} addRowId : 행추가 HTML 의 Table ID
 * @param {string} locOpt   : first, last, before, after
 * @param {int} rowIdx      : Row Index [ before, after 적용 시 ]
 * @returns {int} addRowIdx : 추가 된 tr Tag Index
 * @description 한 줄 추가
 *******************************************************/
function gf_insertRow(){
    var args = gf_insertRow.arguments;
    
    var addRowIdx = -1;
    
    var targetId = args.length > 0 ? args[0] != "" ? args[0] : DE_DATA_GRID_ID : DE_DATA_GRID_ID;
    var addRowId = args.length > 1 ? args[1] != "" ? args[1] : DE_ADDROW_HTML_ID : DE_ADDROW_HTML_ID;
    var locOpt   = args.length > 2 ? args[2] != "" ? args[2] : DE_ADDROW_LOCATION : DE_ADDROW_LOCATION;
    var rowIdx   = args.length > 3 ? args[3] : -1;
    
    var targetObj      = $("#" + targetId + " tbody");
    var targetTrObj    = $("#" + targetId + " tbody tr");
    var targetTrSelObj = $("#" + targetId + " tbody tr:eq(" + rowIdx + ")");
    var addRowHtml     = $("#" + addRowId + " tbody").html();
    
    // 검색 결과가 없을 경우 해당 tr 삭제 후 한 줄 추가 !!
    if($("#" + targetId + " tfoot #noResultList").length == 1){
        $("#" + targetId + " tfoot tr").remove();
    }
    
    if(locOpt == "before"){               // 선택한 행 before
        targetTrSelObj.before(addRowHtml);
        
        addRowIdx = rowIdx;
    } else if(locOpt == "after"){         // 선택한 행 after
        targetTrSelObj.after(addRowHtml);
        
        addRowIdx = rowIdx + 1;
    } else if(locOpt == "first"){         // first
        targetObj.prepend(addRowHtml);
        
        addRowIdx = 0;
    } else {                              // last : default
        targetObj.append(addRowHtml);
        
        addRowIdx = $("#" + targetId + " tbody tr").length - 1;
    }
    
    return addRowIdx;
}

function gf_insertHtml(){
    var args = gf_insertHtml.arguments;
    
    var addRowIdx = -1;
    
    var targetId = args.length > 0 ? args[0] != "" ? args[0] : DE_DATA_GRID_ID : DE_DATA_GRID_ID;
    var addHtml  = args.length > 1 ? args[1] != "" ? args[1] : $("#" + DE_ADDROW_HTML_ID + " tbody").html() : $("#" + DE_ADDROW_HTML_ID + " tbody").html();
    var locOpt   = args.length > 2 ? args[2] != "" ? args[2] : DE_ADDROW_LOCATION : DE_ADDROW_LOCATION;
    var rowIdx   = args.length > 3 ? args[3] : -1;
    
    var targetObj      = $("#" + targetId + " tbody");
    var targetTrObj    = $("#" + targetId + " tbody tr");
    var targetTrSelObj = $("#" + targetId + " tbody tr:eq(" + rowIdx + ")");
    
    // 검색 결과가 없을 경우 해당 tr 삭제 후 한 줄 추가 !!
    if($("#" + targetId + " tfoot #noResultList").length == 1){
        $("#" + targetId + " tfoot tr").remove();
    }
    
    if(locOpt == "before"){               // 선택한 행 before
        targetTrSelObj.before(addHtml);
        
        addRowIdx = rowIdx;
    } else if(locOpt == "after"){         // 선택한 행 after
        targetTrSelObj.after(addHtml);
        
        addRowIdx = rowIdx + 1;
    } else if(locOpt == "first"){         // first
        targetObj.prepend(addHtml);
        
        addRowIdx = 0;
    } else {                              // last : default
        targetObj.append(addHtml);
        
        addRowIdx = $("#" + targetId + " tbody tr").length - 1;
    }
    
    return addRowIdx;
}

/*******************************************************
 * Grid Store 시에 저장 가능한지 체크  !!
 * @param {string} targetId : Target ID
 * @returns int
 * @description Grid Store 시에 저장 가능한지 체크
 *******************************************************/
function gf_getStoreCheckCnt(){
    var args = gf_getStoreCheckCnt.arguments;
    
    var targetId = args.length > 0 ? args[0] != "" ? args[0] : DE_DATA_GRID_ID : DE_DATA_GRID_ID;
    
    var storCheckCnt = -1;
    
    $("#" + targetId + " input[id=crudFlag]").each(function() {
        if($(this).val() != "R" && $(this).val() != "X"){
            storCheckCnt++;
        }
    });
    
    return storCheckCnt;
}

/*******************************************************
 * Grid Delete Row !!
 * 
 * @param {int} rowIdx      : 현재 Row Index
 * @param {string} targetId : 행삭제 될 Target ID
 * @returns N/A
 * @description 행삭제
 *******************************************************/
function gf_deleteRow(){
    var args = gf_deleteRow.arguments;
    
    var rowIdx   = args.length > 0 ? args[0] : gf_currentRow(targetId);
    var targetId = args.length > 1 ? args[1] != "" ? args[1] : DE_DATA_GRID_ID : DE_DATA_GRID_ID;
    
    if(rowIdx >= 0){
        $("#" + targetId + " tbody tr:eq(" + rowIdx + ")").remove();
    }
}

/*******************************************************
 * Grid Multiple Delete Row !!
 * @param {string} targetId : 행삭제 될 Target ID
 * @param {stirng} checkId  : checkbox ID
 * @returns N/A
 * @description 다중 행삭제
 *******************************************************/
function gf_deleteRows(){
    var args = gf_deleteRows.arguments;
    
    var targetId  = args.length > 0 ? args[0] != "" ? args[0] : DE_DATA_GRID_ID : DE_DATA_GRID_ID;
    var checkId   = args.length > 1 ? args[1] != "" ? args[1] : DE_LIST_CHK : DE_LIST_CHK;
    var deleteOpt = args.length > 2 ? args[2] != "" ? args[2] : "remove" : "remove";    // Delete Option : remove,hide
    
    if(!gf_checkingRows(targetId, checkId)){
        return false;
    }
    
    var k = 0;
    var arrDelRowIdx = new Array();
    
    var trLength = $("#" + targetId + " tbody tr").length;
    
    $($("#" + targetId + " tbody tr").get().reverse()).each(function(idx) {
        var rowIdx = (trLength - 1) - idx;
        
        if($("#" + targetId + " input[id=" + checkId + "]:eq(" + rowIdx + ")").is(":checked")){
            if(deleteOpt == "remove"){
                $(this).remove();
            } else {
                var crudFlagObj = $("#crudFlag", this);
                
                if(crudFlagObj.val() == "R"){
                    crudFlagObj.val("D");    // 실제 DB 에서 삭제 하기 위한 셋팅
                    
                    $(this).hide();
                } else if(crudFlagObj.val() == "C"){
                    $(this).remove();
                }
            }
            
            arrDelRowIdx[k++] = rowIdx;
        }
    });
    
    // Default 전체 선택 해제
    gf_allListChkRelease(targetId, (checkId + "All"));
    
    return arrDelRowIdx;
}

function gf_multiDeleteRows(){
    var args = gf_multiDeleteRows.arguments;
    
    var arrDelRowIdx = args.length > 0 ? args[0] != "" ? args[0] : -1 : -1;
    var targetId     = args.length > 1 ? args[1] != "" ? args[1] : DE_DATA_GRID_ID : DE_DATA_GRID_ID;
    var mergeLength  = args.length > 2 ? args[2] != "" ? args[2] : 1 : 1;
    
    for(var i=0; i<arrDelRowIdx.length; i++){
        for(var j=mergeLength; j>0; j--){
            var delRowIdx = (Number(arrDelRowIdx[i]) * mergeLength) + (j - 1);
            
            gf_deleteRow(delRowIdx, targetId);
        }
    }
}

/*******************************************************
 * Grid 전체 체크 해제 !!
 * @param {string} targetId : Target ID
 * @param {string} checkId  : Check All ID
 * @returns N/A
 * @description Grid 전체 체크 해제 !!
 *******************************************************/
function gf_allListChkRelease(){
    var args = gf_allListChkRelease.arguments;
    
    var targetId = args.length > 0 ? args[0] != "" ? args[0] : DE_DATA_GRID_ID : DE_DATA_GRID_ID;
    var checkId  = args.length > 1 ? args[1] != "" ? args[1] : DE_LIST_CHK : DE_LIST_CHK;
    
    // Default 전체 선택 해제
    // 전체 선택 ID는 다음과 맞춰줌 : list checkBox ID + "All" [ ex : listChkAll ]
    $("#" + targetId + " input:checkbox[id=" + checkId + "]").prop("checked", false);
}


/*******************************************************
 * Grid Store !!
 * @param {string} targetId : 삭제 될 Target ID
 * @param {string} rowLenChkYn : 저자할 데이터가 없습니다 라는 메세지 체크 여부
 * @param {string} msgTargetId : 메세지 Target ID
 * @returns {boolean} bool : true/false
 * @description : Grid 저장시 Multiple Checked
 *******************************************************/
function gf_gridStoreDataCheck(){
    var args = gf_gridStoreDataCheck.arguments;
    
    var targetId    = args.length > 0 ? args[0] : DE_DATA_GRID_ID;
    var rowLenChkYn = args.length > 1 ? args[1] : "Y";
    var msgTargetId = args.length > 2 ? args[2] : targetId;
    
    var targetTrObj = $("#" + targetId + " tbody tr");
    
    if(rowLenChkYn == "Y"){
        if(targetTrObj.length == 0){
            alert("저장할 데이터가 없습니다.");
            return false;
        }
    }
    
    var bool = true;
    
    $("#" + targetId + " ._requiredGrid").each(function(idx) {
        var id  = $(this).attr("id");
        var val = $(this).val();
        
        var tagName   = $(this).prop("tagName").toUpperCase();
        var maxlength = Number($(this).attr("maxlength"));
        
        var thIdx = $(this).parent().index();
        var thTxt = $("#" + msgTargetId + " thead tr:eq(0) th:eq(" + thIdx + ")").text();    // <th> Tag Text
        
        // 필수 체크
        if(val == ""){
            // [field Name] (은)는 필수 입력/선택입니다.
            alert(thTxt.replace(" *", "") + "(은)는 필수 " + (tagName == "SELECT" ? "선택" : "입력") + "입니다.");
            
            $(this).focus();
            
            bool = false;
            
            return false;
        }
        
        // 입력 Byte 수 체크
        if(maxlength != null){
            if(gf_getStrByte(val) > maxlength){
                alert(thTxt.replace(" *", "") + "의 최대 입력 길이 초과입니다.");
                
                $(this).focus();
                
                bool = false;
                
                return false;
            }
        }
    });
    
    return bool;
}

/*******************************************************
 * Table Row Merge !!
 * @param {array} arrColIdx : Row Merge 시킬 Column Index
 * @returns {string} targetId : Row Merge 시킬 Target ID
 * @description : Table Row Merge !!
 *******************************************************/
$.fn.gf_tableRowSpanning = function (strColIdx, isStats) {
    return this.each(function () {
        var arrColIdx = strColIdx.split(",");
        
        for(var i=0; i<arrColIdx.length; i++){
            var colIdx = Number(arrColIdx[i]);
            
            var that;
            
            $('tr', this).each(function (row) {
                $('td:eq(' + colIdx + ')', this).filter(':visible').each(function (col) {
                    if ($(this).html() == $(that).html()
                        //&& $(this).html() != "&nbsp;"
                        && (!isStats || isStats && $(this).prev().html() == $(that).prev().html())
                    ) {
                        rowspan = $(that).attr("rowspan") || 1;
                        rowspan = Number(rowspan) + 1;
                        
                        $(that).attr("rowspan", rowspan);
                        
                        // do your action for the colspan cell here
                        $(this).hide();
                        
                        //$(this).remove(); 
                        // do your action for the old cell here
                        
                    } else {
                        that = this;
                    }
                    
                    // set the that if not already set
                    that = (that == null) ? this : that;
                });
            });
        }
    });
};

/*******************************************************
 * Scroll Table Initialize !!
 * 
 * @param {string} mainTableId
 * @param {string} dataTableId
 * @returns N/A
 * @description 스크롤 테이블 초기화 !!
 *******************************************************/
function gf_initialScrollTable(){
    var args = gf_initialScrollTable.arguments;
    
    var tableId   = args[0] + "Main";
    var arrColWid = args[1];
    
    var tableObj = $("#" + tableId);
    
    $("col", tableObj).each(function(idx){
        $(this).css("width", arrColWid[idx]);
    });
}

/*******************************************************
 * Scroll Table Default Setting !!
 * 
 * @param {string} dataTableId
 * @returns N/A
 * @description 스크롤 테이블 기본 셋팅 !!
 *******************************************************/
function gf_setScrollTable(dataTableId){
    var mainTableObj = $("#" + dataTableId + "Main");
    var dataTableObj = $("#" + dataTableId);
    
    var dataDivWid   = Number(dataTableObj.parent().css("width").replace("px", ""));
    var dataTableWid = Number(dataTableObj.css("width").replace("px", ""));
    
    var scrollbarWid = dataDivWid - dataTableWid;
    
    var arrDataCol = new Array($("col", mainTableObj).length);
    var sumDataCol = 0;
    
    $("tbody tr:eq(0) td", dataTableObj).each(function(idx){
        var dataTdWid = $(this).css("width");
        
        arrDataCol[idx] = Number(dataTdWid.replace("px", ""));
        sumDataCol     += Number(dataTdWid.replace("px", ""));
    });
    
    // 실제 너비와 합계의 너비간의 Dummy !!
    var dummyColWid = dataTableWid - sumDataCol;
    
    // Main Table Header Title Width Resetting !!
    $("col", mainTableObj).each(function(idx){
        var headColWid = arrDataCol[idx];
        
        if((idx + 1) == arrDataCol.length){
            $(this).css("width", (headColWid + scrollbarWid + dummyColWid) + "px");
        } else {
            $(this).css("width", headColWid);
        }
    });
}