
var dropBoxIDs = new Array();

var inputNames = { username: "用户名", password: "密码", verifycode: "验证码" };

function debug(msg) {

    console.debug(msg);
}

function formSubmit(id) {
    document.getElementById(id).submit();
}

//functions to hide url bar
addEventListener("load", function () {
    setTimeout(hideURLbar, 0);
}, false);
function hideURLbar() {
    window.scrollTo(0, 1);
}

/*changed*/
function doCollapse(id, triangle, freeArrow) {

    if (document.getElementById(id + "_content").style.display == "none") {
        document.getElementById(id + "_content").style.display = "block";
        if (freeArrow != undefined) {
            var arrows = freeArrow.split("♥");
            document.getElementById(id).lastChild.innerHTML = "&nbsp;" + arrows[1];
        } else {
            if (triangle == undefined || triangle == true) {
                document.getElementById(id).lastChild.innerHTML = "&nbsp;▲";
            }
        }
    } else {

        document.getElementById(id + "_content").style.display = "none";

        if (freeArrow != undefined) {
            var arrows = freeArrow.split("♥");
            document.getElementById(id).lastChild.innerHTML = "&nbsp;" + arrows[0];
        } else {
            if (triangle == undefined || triangle == true) {
                document.getElementById(id).lastChild.innerHTML = "&nbsp;▼";
            }
        }
    }
}

function doTogether(id, arrow, freeArrow) {

    document.getElementById(id + "_content").style.display = "none";
    if (freeArrow != undefined) {
        var arrows = freeArrow.split("♥");
        document.getElementById(id).lastChild.innerHTML = "&nbsp;" + arrows[0];
    } else {
        if (arrow == undefined || arrow == true) {
            document.getElementById(id).lastChild.innerHTML = "&nbsp;▼";
        }
    }
}

function doTogetherAll(string) {

    var array = string.split("♥");

    for (var i = 0; i < array.length; i++) {
        doTogether(array[i]);
    }
}

/*new 2013-04-19*/
/*tricky:set list title as a value to the key "全部"*/
/*it is possible to put links inside jason data below*/

function doPopupList(list_id, mask_id, selectedTag, tags) {

    var level1stTag = new Array();
    var level2ndTag = new Array();

    var level1stLink = new Array();
    var level2ndLink = new Array();

    var level1stAmt = new Array();
    var level2ndAmt = new Array();

    var oneDimList = false;

    for (x in tags) {

        //		if(x.split("♥").length == 2){
        //			level1stTag.push(x.split("♥")[0]);
        //			level1stLink.push(x.split("♥")[1]);
        //			//debug(x + " " + x.split("♥").length);
        //		}else if(x.split("♥").length == 1){
        //			level1stTag.push(x);
        //			level1stLink.push("");
        //			//debug(x + " " + x.split("♥").length);
        //		}
        //		//debug(x.split("♥")[0] + " " + x.split("♥")[1] + x.split("♥").length);
        //		if(x.split("♥")[0] == selectedTag){
        //			for(var i=0; i<tags[x].length; i++){
        //				if(tags[x][i].split("♥").length == 2){
        //					level2ndTag[i] = tags[x][i].split("♥")[0];
        //					level2ndLink[i] = tags[x][i].split("♥")[1];
        //				}else if(tags[x][i].split("♥").length == 1){
        //					level2ndTag[i] = tags[x][i];
        //					level2ndLink[i] = "";
        //				}
        //			}
        //		}

        if (x.split("♥").length == 3) {
            level1stTag.push(x.split("♥")[0]);
            level1stLink.push(x.split("♥")[1]);
            level1stAmt.push(x.split("♥")[2]);
        } else if (x.split("♥").length == 2) {
            level1stTag.push(x.split("♥")[0]);
            level1stLink.push("");
            level1stAmt.push(x.split("♥")[1]);
        }
        if (x.split("♥")[0] == selectedTag) {
            for (var i = 0; i < tags[x].length; i++) {
                if (tags[x][i].split("♥").length == 3) {
                    level2ndTag[i] = tags[x][i].split("♥")[0];
                    level2ndLink[i] = tags[x][i].split("♥")[1];
                    level2ndAmt[i] = tags[x][i].split("♥")[2];
                } else if (tags[x][i].split("♥").length == 2) {
                    level2ndTag[i] = tags[x][i].split("♥")[0]; ;
                    level2ndLink[i] = "";
                    level2ndAmt[i] = tags[x][i].split("♥")[1];
                }
            }
        }

    }

    if (tags[level1stTag[0] + "♥" + level1stLink[0] + "♥" + level1stAmt[0]] == "排序") {
        oneDimList = true;
    }

    var rows;
    if (level1stTag.length > level2ndTag.length) {
        rows = level1stTag.length;
    } else {
        rows = level2ndTag.length;
    }

    //debug(rows);

    if (mask_id != null) {

        var maskHeight = ((40 + 2) * (rows + 2) + 78);

        if (maskHeight < document.body.clientHeight) {
            maskHeight = document.body.clientHeight;
        }

        document.getElementById(mask_id).style.height = maskHeight + "px";
        //document.getElementById(mask_id).style.height = ((40 + 2) * (rows + 2) + 78) + "px";
        //document.getElementById(mask_id).style.height = document.body.clientHeight + "px";

        document.getElementById(mask_id).style.top = "0px";
        document.getElementById(mask_id).style.display = "block";
        document.getElementById(mask_id).setAttribute("onclick", "doClosePopup('popup_list', 'screen_mask');");
    }

    var popListNode = document.getElementById(list_id);
    //	while(popListNode.hasChildNodes()){
    //		popListNode.removeChild(popListNode.childNodes[0]);
    //	}

    removeAllChildNodes(popListNode);

    var ul1stNode = document.createElement("ul");
    var attribute = document.createAttribute("style");
    attribute.value = "font-size:14px;color:#878787;list-style:none;padding:10px;margin:0px;text-align:center;";
    ul1stNode.setAttributeNode(attribute);

    var li1stNode = document.createElement("li");
    attribute = document.createAttribute("style");
    attribute.value = "vertical-align:top;display:inline-block;width:49%;";
    li1stNode.setAttributeNode(attribute);
    var ul2ndNode = document.createElement("ul");
    attribute = document.createAttribute("style");
    attribute.value = "list-style:none;padding:0px;margin:0px;";
    ul2ndNode.setAttributeNode(attribute);

    var li2ndNode = document.createElement("li");
    attribute = document.createAttribute("style");
    attribute.value = "border-radius:5px 0px 0px 0px;color:#1d1d1d;padding-top:10px;background-color:#ededed;border-bottom:2px #cccccc groove;height:30px;";
    li2ndNode.setAttributeNode(attribute);

    var spanNode = document.createElement("span");
    attribute = document.createAttribute("style");
    attribute.value = "color:#ed6d00;font-size:14px;font-weight:bold;float:right;margin-right:10px;";
    spanNode.setAttributeNode(attribute);

    //var textArray = tags[level1stTag[0] + "♥" + level1stLink[0]].split("");
    var textArray = tags[level1stTag[0] + "♥" + level1stLink[0] + "♥" + level1stAmt[0]].split("");

    var textNode;

    if (textArray.length == 2) {
        textNode = document.createTextNode(textArray[0]);
    } else if (textArray.length == 4) {
        textNode = document.createTextNode(textArray[0] + textArray[1]);
    }

    spanNode.appendChild(textNode);
    li2ndNode.appendChild(spanNode);

    ul2ndNode.appendChild(li2ndNode);



    for (var i = 0; i < rows; i++) {

        li2ndNode = document.createElement("li");
        attribute = document.createAttribute("style");

        if (i < level1stTag.length) {
            if (level1stTag[i] == selectedTag) {
                attribute.value = "color:#1d1d1d;padding-top:10px;background-color:#ededed;border-bottom:1px #878787 dotted;height:30px;";
                if (i == level1stTag.length - 1) {
                    attribute.value = "color:#1d1d1d;padding-top:10px;background-color:#ededed;border-bottom:1px #ededed solid;height:30px;";
                }
            } else {
                attribute.value = "padding-top:10px;background-color:#ffffff;border-bottom:1px #878787 dotted;height:30px;";
                if (i == level1stTag.length - 1) {
                    attribute.value = "padding-top:10px;background-color:#ffffff;border-bottom:1px #ffffff solid;height:30px;";
                }
            }

            if (i == rows - 1) {
                attribute.value = attribute.value + "border-radius:0px 0px 0px 5px;";
            }

            li2ndNode.setAttributeNode(attribute);
            attribute = document.createAttribute("onclick");
            //if(tags[level1stTag[i] + "♥" + level1stLink[i]] == "" || level1stTag[i] == "全部" || level1stTag[i] == "默认排序"){
            if (tags[level1stTag[i] + "♥" + level1stLink[i] + "♥" + level1stAmt[i]] == "" || level1stTag[i] == "全部" || level1stTag[i] == "默认排序") {
                //add lbs services
                if (level1stTag[i] == "身边") {
                    attribute.value = level1stLink[i] + ";";
                }
                else {
                    attribute.value = "doHREF('" + level1stLink[i] + "');";
                }
            } else {
                //alert(level1stTag[0]);
                //switch(tags[level1stTag[0] + "♥" + level1stLink[0]]){
                switch (tags[level1stTag[0] + "♥" + level1stLink[0] + "♥" + level1stAmt[0]]) {

                    case "分类":
                        attribute.value = "doPopupList('popup_list', 'screen_mask', this.innerHTML, catgoryTags);";
                        //attribute.value = "doPopupList('popup_list', 'screen_mask', initSelectedTags('navi_top')[0], catgoryTags);";
                        break;

                    case "城区":
                        attribute.value = "doPopupList('popup_list', 'screen_mask', this.innerHTML, districtTags);";
                        //attribute.value = "doPopupList('popup_list', 'screen_mask', initSelectedTags('navi_top')[0], districtTags);";
                        break;

                    case "排序":
                        attribute.value = "doPopupList('popup_list', 'screen_mask', this.innerHTML, sortTags);";
                        //attribute.value = "doPopupList('popup_list', 'screen_mask', initSelectedTags('navi_top')[0], sortTags);";
                        break;

                }

            }
            li2ndNode.setAttributeNode(attribute);
            textNode = document.createTextNode(level1stTag[i]);
            li2ndNode.appendChild(textNode);
        } else {
            attribute.value = "background-color:#ffffff;border-bottom:1px #ffffff solid;height:40px;";

            if (i == rows - 1) {
                attribute.value = attribute.value + "border-radius:0px 0px 0px 5px;";
            }

            li2ndNode.setAttributeNode(attribute);
        }
        //1st level tag
        if (oneDimList == false) {
            ul2ndNode.appendChild(li2ndNode);
        }
    }

    li1stNode.appendChild(ul2ndNode);
    ul1stNode.appendChild(li1stNode);
    popListNode.appendChild(ul1stNode);

    li1stNode = document.createElement("li");
    attribute = document.createAttribute("style");

    //attribute.value = "display:inline-block;width:49%;margin-left:-1px;";
    if (oneDimList == false) {
        attribute.value = "display:inline-block;width:49%;margin-left:-1px;";
    } else {
        attribute.value = "display:inline-block;width:49%;";
    }

    li1stNode.setAttributeNode(attribute);
    ul2ndNode = document.createElement("ul");
    attribute = document.createAttribute("style");
    attribute.value = "list-style:none;padding:0px;margin:0px;";
    ul2ndNode.setAttributeNode(attribute);

    li2ndNode = document.createElement("li");
    attribute = document.createAttribute("style");
    attribute.value = "border-radius:0px 5px 0px 0px;color:#1d1d1d;padding-top:10px;background-color:#ededed;border-bottom:2px #cccccc groove;height:30px;";
    li2ndNode.setAttributeNode(attribute);

    spanNode = document.createElement("span");
    attribute = document.createAttribute("style");
    attribute.value = "color:#ed6d00;font-size:14px;font-weight:bold;float:left;margin-left:10px;";
    spanNode.setAttributeNode(attribute);

    if (textArray.length == 2) {
        textNode = document.createTextNode(textArray[1]);
    } else if (textArray.length == 4) {
        textNode = document.createTextNode(textArray[2] + textArray[3]);
    }

    spanNode.appendChild(textNode);
    li2ndNode.appendChild(spanNode);


    var closeImgNode = document.createElement("img");
    attribute = document.createAttribute("src");
    attribute.value = "/images/close.png";
    closeImgNode.setAttributeNode(attribute);
    attribute = document.createAttribute("style");
    attribute.value = "height:20px;width:20px;float:right;margin-right:15px;";
    closeImgNode.setAttributeNode(attribute);
    attribute = document.createAttribute("onclick");
    attribute.value = "doClosePopup('popup_list', 'screen_mask');";
    closeImgNode.setAttributeNode(attribute);

    li2ndNode.appendChild(closeImgNode);

    ul2ndNode.appendChild(li2ndNode);

    for (var i = 0; i < rows; i++) {

        li2ndNode = document.createElement("li");
        attribute = document.createAttribute("style");
        attribute.value = "color:#1d1d1d;padding-top:10px;background-color:#ededed;border-bottom:1px #ededed solid;height:30px;";

        if (i == rows - 1) {
            attribute.value = attribute.value + "border-radius:0px 0px 5px 0px;";
        }

        li2ndNode.setAttributeNode(attribute);

        if (i < level2ndTag.length) {

            //add link here
            //li2ndNode.setAttribute("onclick", "doHREF(" + "'index.html'" + ");");
            li2ndNode.setAttribute("onclick", "doHREF('" + level2ndLink[i] + "');");

            var textNode = document.createTextNode(level2ndTag[i]);
            li2ndNode.appendChild(textNode);
        }

        //2nd level tag
        if (oneDimList == false) {
            ul2ndNode.appendChild(li2ndNode);
        }
    }

    li1stNode.appendChild(ul2ndNode);
    ul1stNode.appendChild(li1stNode);

    //=====================
    //add one dimensional list here into li1stNode -> ul2ndNode
    if (oneDimList == true) {
        for (var i = 0; i < rows; i++) {
            var divNode = document.createElement("div");
            li1stNode = document.createElement("li");
            if (i == rows - 1) {
                li1stNode.setAttribute("style", "width:100%;color:#1d1d1d;padding-top:10px;background-color:#ffffff;border-bottom:1px #878787 dotted;height:30px;border-radius:0px 0px 5px 5px;");
            } else {
                li1stNode.setAttribute("style", "width:100%;color:#1d1d1d;padding-top:10px;background-color:#ffffff;border-bottom:1px #878787 dotted;height:30px;");
            }
            li1stNode.setAttribute("onclick", "doHREF('" + level1stLink[i] + "');");
            li1stNode.appendChild(document.createTextNode(level1stTag[i]));
            divNode.setAttribute("style", "position:relative;top:-4px;padding:0px 1% 0px 1%;");
            divNode.appendChild(li1stNode);
            ul1stNode.appendChild(divNode);
        }
    }
    //ul1stNode.appendChild(li1stNode);
    //=====================

    popListNode.appendChild(ul1stNode);

    popListNode.style.display = "block";
}

function doClosePopup(list_id, mask_id) {
    document.getElementById(list_id).style.display = "none";
    document.getElementById(mask_id).style.display = "none";
}

function doDropBox(id) {

    var included = false;

    if (document.getElementById(id).style.display == "none") {
        document.getElementById(id).style.display = "block";
    } else {
        document.getElementById(id).style.display = "none";
    }


    if (dropBoxIDs.length == 0) {
        dropBoxIDs.push(id);
    }
    else {
        for (var i = 0; i < dropBoxIDs.length; i++) {
            if (dropBoxIDs[i] == id) {
                included = true;
            } else {
                document.getElementById(dropBoxIDs[i]).style.display = "none";
            }
        }
        if (included == false) {
            dropBoxIDs.push(id);
        }
    }
}

function doHREF(url) {

    window.location.assign(url);
}

function closeIt(id, dDay) {

    document.getElementById(id).style.display = "none";
    if (dDay == undefined) {
        docCookies.removeItem(id);
    } else {
        docCookies.setItem(id, 0, new Date(Date.now() + 10 * 1000));
    }
}

function openIt(id, dDay) {

    document.getElementById(id).style.display = "block";
    if (dDay == undefined) {
        docCookies.removeItem(id);
    } else {
        //for testing in 10 seconds
        //Date.now() provides value in milliseconds
        docCookies.setItem(id, 0, new Date(Date.now() + 10 * 1000));
        //docCookies.setItem(id, 0, new Date(Date.now() + dDay * 24 * 60 * 60 * 1000));
    }
}

function doNaviConfirm(string) {

    var array = string.split("♥");
    var result = confirm(array[0]);
    if (result == true) {
        window.location.assign(array[1]);
    }
}

function setDisplay(id) {
    if (document.getElementById(id).style.display == "none") {
        document.getElementById(id).style.display = "block";
    } else {
        document.getElementById(id).style.display = "none";
    }
}

function cleanInput(input) {

    if (input.value == input.defaultValue) {
        input.value = "";
        input.style.color = "#878787";
        if (((input.id).split("_")).pop() == "password") {
            input.type = "password";
        }
    }
}

function setInput(input) {

    if (input.value == "") {
        input.value = input.defaultValue;
        input.style.color = "#878787";
        if (input.type == "password") {
            input.type = "text";
        }
    }
}

function checkForm(string) {

    switch (string) {

        case "mobilephone":
            if (document.getElementById("mobilephone").value == "") {
                alert("请输入手机号码，用于接受窝窝券");
            } else {
                document.getElementById("order_form").submit();
            }
            break;
    }
}


/*changed*/
function caculTotal(input) {
    //alert("called" + document.getElementById("price").innerHTML);
    //var length = input.id.split("_").length;
    //debug("length: " + length);
    if (input.value != "") {

        if (input.min != "") {
            if (new Number(input.value) < new Number(input.min)) {
                input.value = input.min;
            }
        }

        if (input.max != "") {
            if (new Number(input.value) > new Number(input.max)) {
                input.value = input.max;
            }
        }

        var index = "";
        var length = input.id.split("_").length;
        if (length != 1) {
            index = "_" + input.id.split("_")[1];
        }
        //var total = "￥" + (new Number(document.getElementById("price" + index).innerHTML.substring(1)) * new Number(input.value)).toFixed(2);
        var total = rmbFormat(new Number(document.getElementById("price" + index).innerHTML.substring(1)) * new Number(input.value));
        document.getElementById("total" + index).innerHTML = total;

        //return (new Number(document.getElementById("price" + index).innerHTML.substring(1)) * new Number(input.value));
    }
}

function rmbToNumber(rmb) {
    return new Number(rmb.split("￥")[1]);
}

function rmbFormat(num) {
    return "￥" + new Number(num).toFixed(2);
}

//functions to count down timer
//if greater than 7 days, displaying "7天以上"; else, displaying counted down time
var overTime;
var nowTime;
var endTime;
function countDownTimer(string) {

    var splited = string.split("：");
    splited = splited[1].split("天");
    var restD = splited.shift();
    splited = splited.toString();
    splited = splited.split("小时");
    var restH = splited.shift();
    splited = splited.toString();
    splited = splited.split("分");
    var restM = splited.shift();
    splited = splited.toString();
    splited = splited.split("秒");
    var restS = splited.shift();

    overTime = 1000 * 60 * 60 * 24 * restD + 1000 * 60 * 60 * restH + 1000 * 60 * restM + 1000 * restS;
    nowTime = new Date();
    endTime = new Date(nowTime.getTime() + overTime);

    getRealTime();
}

function getRealTime() {

    nowTime = new Date();
    var totalMS = endTime.getTime() - nowTime.getTime();
    var nD = Math.floor(totalMS / (1000 * 60 * 60 * 24));
    if (nD >= 7) {
        document.getElementById("remainTime").childNodes[0].nodeValue = "剩余时间：7天以上";
    } else {
        document.getElementById("remainTime").childNodes[0].nodeValue = "剩余时间：";
        var nH = Math.floor(totalMS / (1000 * 60 * 60)) % 24;
        var nM = Math.floor(totalMS / (1000 * 60)) % 60;
        var nS = Math.floor(totalMS / 1000) % 60;
        var nMS = Math.floor(totalMS / 100) % 10;
        if (totalMS >= 0) {
            document.getElementById("remainD").innerHTML = nD + "天";
            document.getElementById("remainH").innerHTML = nH + "小时";
            document.getElementById("remainM").innerHTML = nM + "分";
            document.getElementById("remainS").innerHTML = nS + "秒";
            //document.getElementById("remainS").innerHTML=nS + "." + nMS + "秒";
        }
    }
    setTimeout(getRealTime, 100);
}

//js cookie utilities
var docCookies = {

    getItem: function (sKey) {
        if (!sKey || !this.hasItem(sKey)) {
            return null;
        }
        return unescape(document.cookie.replace(new RegExp("(?:^|.*;\\s*)" + escape(sKey).replace(/[\-\.\+\*]/g, "\\$&") + "\\s*\\=\\s*((?:[^;](?!;))*[^;]?).*"), "$1"));
    },
    setItem: function (sKey, sValue, vEnd, sPath, sDomain, bSecure) {
        if (!sKey || /^(?:expires|max\-age|path|domain|secure)$/i.test(sKey)) {
            return;
        }
        var sExpires = "";
        if (vEnd) {
            switch (vEnd.constructor) {
                case Number:
                    sExpires = vEnd === Infinity ? "; expires=Tue, 19 Jan 2038 03:14:07 GMT" : "; max-age=" + vEnd;
                    break;
                case String:
                    sExpires = "; expires=" + vEnd;
                    break;
                case Date:
                    sExpires = "; expires=" + vEnd.toGMTString();
                    break;
            }
        }
        //alert(sExpires);
        document.cookie = escape(sKey) + "=" + escape(sValue) + sExpires + (sDomain ? "; domain=" + sDomain : "") + (sPath ? "; path=" + sPath : "") + (bSecure ? "; secure" : "");
        //alert(document.cookie);
    },
    removeItem: function (sKey, sPath) {
        if (!sKey || !this.hasItem(sKey)) {
            return;
        }
        document.cookie = escape(sKey) + "=; expires=Thu, 01 Jan 1970 00:00:00 GMT" + (sPath ? "; path=" + sPath : "");
    },
    hasItem: function (sKey) {
        return (new RegExp("(?:^|;\\s*)" + escape(sKey).replace(/[\-\.\+\*]/g, "\\$&") + "\\s*\\=")).test(document.cookie);
    },
    keys: /* optional method: you can safely remove it! */function () {
        var aKeys = document.cookie.replace(/((?:^|\s*;)[^\=]+)(?=;|$)|^\s*|\s*(?:\=[^;]*)?(?:\1|$)/g, "").split(/\s*(?:\=[^;]*)?;\s*/);
        for (var nIdx = 0; nIdx < aKeys.length; nIdx++) { aKeys[nIdx] = unescape(aKeys[nIdx]); }
        return aKeys;
    }
};

//searching key word record functions
var recordedWords = new Array();
function doRecord(id, dDay) {
    var words = "";
    var value_id = (id.split("_"))[0];
    var newInput = document.getElementById(value_id).value;
    var reinput = false;
    if (docCookies.getItem(id) != null) {
        for (var i = 0; i < recordedWords.length; i++) {
            words += recordedWords[i] + "♥";
        }
        for (var i = 0; i < recordedWords.length; i++) {
            if (newInput == recordedWords[i]) {
                reinput = true;
                break;
            }
        }
    }

    //problem caused by put value to placeholder
    if (newInput != document.getElementById(value_id).defaultValue && reinput != true) {
        words += newInput + "♥";
    }

    //cookie lives in days
    //docCookies.setItem(id, words, 30 * 24 * 60 * 60);
    docCookies.setItem(id, words, new Date(Date.now() + dDay * 24 * 60 * 60 * 1000), '/');

}

function checkRecord(id, uri) {
    if (docCookies.getItem(id) != null) {
        recordedWords = docCookies.getItem(id).split("♥");
        recordedWords.pop();
        var incr = 0;
        var recordNode = document.getElementById(id);
        while (recordNode.hasChildNodes()) {
            recordNode.removeChild(recordNode.childNodes[0]);
        }

        removeAllChildNodes(recordNode);
        var ul1stNode = document.createElement("ul");
        var attribute = document.createAttribute("style");
        attribute.value = "list-style:none;padding:0px;margin:0px;";
        ul1stNode.setAttributeNode(attribute);

        for (var i = 0; i < recordedWords.length / 3; i++) {
            var li1stNode = document.createElement("li");
            var ul2ndNode = document.createElement("ul");
            attribute = document.createAttribute("style");
            attribute.value = "list-style:none;padding:0px;margin:0px;";
            ul2ndNode.setAttributeNode(attribute);
            for (var j = 0; j < 3; j++) {

                var li2nd2Node = document.createElement("li");
                attribute = document.createAttribute("style");
                attribute.value = "margin-bottom:3px;height:20px;line-height:20px;width:26%;display:inline-block;";
                li2nd2Node.setAttributeNode(attribute);

                if (incr < recordedWords.length) {
                    var aNode = document.createElement("a");
                    var textNode = document.createTextNode(recordedWords[incr]);
                    attribute = document.createAttribute("href");
                    //这里修改搜索的网络地址
                    attribute.value = "http://" + window.location.host + uri+"?keywords=" + recordedWords[incr];
                    aNode.setAttributeNode(attribute);
                    aNode.appendChild(textNode);
                    li2nd2Node.appendChild(aNode);
                }
                ul2ndNode.appendChild(li2nd2Node);
                incr++;

                if (j < 2) {
                    var li2nd1Node = document.createElement("li");
                    attribute = document.createAttribute("style");
                    attribute.value = "margin-bottom:3px;height:20px;line-height:20px;width:6%;display:inline-block;";
                    li2nd1Node.setAttributeNode(attribute);
                    ul2ndNode.appendChild(li2nd1Node);
                }
            }

            li1stNode.appendChild(ul2ndNode);
            ul1stNode.appendChild(li1stNode);
        }
        recordNode.appendChild(ul1stNode);
    }
}

function cleanRecord(id) {
    var recordNode = document.getElementById(id);
    while (recordNode.hasChildNodes()) {
        recordNode.removeChild(recordNode.childNodes[0]);
    }
    removeAllChildNodes(recordNode);
    docCookies.removeItem(id, '/');
}

//functions for record recent pay method
function checkRecentPayMethod(id) {
    //alert(docCookies.getItem(id));
    if (docCookies.getItem(id) != null) {

        var ulNode = document.getElementById(id);

        while (ulNode.hasChildNodes()) {
            ulNode.removeChild(ulNode.childNodes[0]);
        }

        removeAllChildNodes(ulNode);
        var clonedNode = document.getElementById(docCookies.getItem(id)).cloneNode(true);

        clonedNode.setAttribute("id", clonedNode.id + "_recent");
        clonedNode.setAttribute("onclick", "javascript:document.getElementById(this.id + '_r').checked='true';");
        var nodeList = clonedNode.childNodes;

        for (var i = 0; i < nodeList.length; i++) {

            if (nodeList[i].nodeName == "INPUT" || nodeList[i].nodeName == "input") {

                nodeList[i].setAttribute("id", clonedNode.id + "_r");

                break;
            }
        }

        ulNode.appendChild(clonedNode);
        document.getElementById((id.split("_content"))[0]).style.display = "block";
        document.getElementById(id).style.display = "block";
        document.getElementById('payment_collapse_content').style.display = "none";
    }
}

function recordIdPair(key_id, value_id, dDay) {

    //cookie lives in days
    //docCookies.setItem(id, words, 30 * 24 * 60 * 60);
    docCookies.setItem(key_id, value_id, new Date(Date.now() + dDay * 24 * 60 * 60 * 1000));

    /*add by hz 13/07/01 实物单选择银行*/
    var hidbidobj = document.getElementById("hidbid");
    if (hidbidobj != null && hidbidobj != undefined) {
        hidbidobj.value = value_id;
    }
}

//id "checkbalance" value 0 : not work -- value 1 : on work -- value 2 : on freeze
function checkBalance(id) {
    if (new Number(document.getElementById("balance").innerHTML.substring(1)) == 0) {
        document.getElementById(id).checked = false;
        document.getElementById(id).disabled = true;
        return;
    } else {
        switch (document.getElementById(id).value) {
            case "0":
                document.getElementById(id).checked = false;
                document.getElementById(id).disabled = true;
                listWords("balance_condition", { style: "color:#29363d; font-size:12px;", class: "msg_box", innerHTML: "您还没有设置支付密码，无法完成余额支付，请登录窝窝团WEB网站设置支付密码。" });
                document.getElementById("extra").innerHTML = document.getElementById("total").innerHTML;
                break;
            case "1":
                document.getElementById(id).disabled = false;
                document.getElementById(id).checked = true;
                //listInput("balance_condition", {onfocus:"cleanInput(this);", onblur:"setInput(this);", id:"pay_password", class:"input_field", style:"width:78%;height:30px;margin:0px;", type:"text", value:"请输入支付密码使用余额"}, {class:"plain_button_grey", style:"float:right;width:20%;color:#ff4200;font-size:12px;font-weight:bold;padding:5px;", onclick:"doAjax('index.html');", innerHTML:"确定"});
                listInput("balance_condition", { onfocus: "cleanInput(this);", onblur: "setInput(this);", id: "pay_password", class: "input_field", style: "width:100%;height:30px;margin:0px;", type: "text", value: "请输入支付密码使用余额" }, null);
                document.getElementById("extra").innerHTML = document.getElementById("total").innerHTML;
                break;
            case "2":
                document.getElementById(id).checked = false;
                document.getElementById(id).disabled = true;
                listWords("balance_condition", { style: "color:#29363d; font-size:12px;", class: "msg_box", innerHTML: "由于您输入错误密码次数过多，您的余额将被冻结3个小时。" });
                document.getElementById("extra").innerHTML = document.getElementById("total").innerHTML;
                break;
            //suppose there is no passward needed
            case "3":
                document.getElementById(id).checked = true;
                document.getElementById(id).disabled = false;
                var balanceConditionNode = document.getElementById("balance_condition");
                while (balanceConditionNode.hasChildNodes()) {
                    balanceConditionNode.removeChild(balanceConditionNode.childNodes[0]);
                }
                removeAllChildNodes(balanceConditionNode);
                //caculBalance("checkbalance");
                break;
        }
    }
}

function listInput(id, input, button) {

    var containerNode = document.getElementById(id);
    var inputNode = document.createElement("input");
    var buttonNode = document.createElement("div");

    var key;

    if (input != null) {
        //alert("called");
        for (key in input) {
            inputNode.setAttribute(key, input[key]);
        }

        containerNode.appendChild(inputNode);
    }

    if (button != null) {
        for (key in button) {
            if (key == "innerHTML") {
                buttonNode.innerHTML = button[key];
                continue;
            }
            buttonNode.setAttribute(key, button[key]);
        }

        containerNode.appendChild(buttonNode);
    }

}

function caculBalance(id) {
    var extra;
    var num = new Number(document.getElementById("total").innerHTML.substring(1)) - new Number(document.getElementById("balance").innerHTML.substring(1));

    if (document.getElementById(id).disabled == true) {
        document.getElementById('extra').innerHTML = "￥" + new Number(document.getElementById("total").innerHTML.substring(1)).toFixed(2);
        listWords("pay_tip", { style: "color:#29363d;font-size:12px;background-color:#e5f1ff;border:1px #377ba6 solid;", class: "msg_box", innerHTML: "请点击下列支付方式完成支付。" });
    } else {
        if (document.getElementById(id).checked == true) {
            if (num > 0) {
                extra = "￥" + num.toFixed(2);
                document.getElementById('extra').innerHTML = extra;
                document.getElementById('pay_tip').innerHTML = "";
                listWords("pay_tip", { style: "color:#29363d;font-size:12px;background-color:#e5f1ff;border:1px #377ba6 solid;", class: "msg_box", innerHTML: "请输入支付密码，并点击下列支付方式完成支付。" });
            } else {
                //				var containerNode = document.getElementById("extra").parentNode.parentNode;
                //				containerNode.childNodes[0].childNodes[0].nodeValue = "余额全额支付：";
                //				containerNode.setAttribute("id", "ballance_pay_button");
                //				listInput("ballance_pay_button", null, {class:"plain_button_grey", style:"position:relative;top:-6px;border-radius:2px;float:right;width:20%;color:#ff4200;font-size:12px;font-weight:bold;padding:5px;", onclick:"doHREF('index.html');", innerHTML:"确定"});
                //				document.getElementById('pay_tip').innerHTML = "";
                //				listWords("pay_tip", {style:"color:#29363d;font-size:12px;background-color:#e5f1ff;border:1px #377ba6 solid;", class:"msg_box", innerHTML:"请点击“确定”按钮进行“余额全额支付”；或点击下列支付方式完成支付。"});
                //				document.getElementById('extra').innerHTML = "";

                var liNode = document.getElementById("extra").parentNode.parentNode;
                liNode.style.display = "none";
                document.getElementById("ballance_pay_button").innerHTML = "";
                document.getElementById("ballance_pay_button").style.marginBottom = "50px";
                listInput("ballance_pay_button", null, { class: "plain_button_yellow", style: "border-radius:4px;float:right;width:100%;color:#ff4200;font-size:12px;font-weight:bold;padding:5px;", onclick: "doHREF('index.html');", innerHTML: "余额全额支付&nbsp;&nbsp;&nbsp;&nbsp;" + document.getElementById('total').innerHTML });
                document.getElementById("pay_tip").innerHTML = "";
                listWords("pay_tip", { style: "color:#29363d;font-size:12px;background-color:#e5f1ff;border:1px #377ba6 solid;", class: "msg_box", innerHTML: "请输入支付密码，并点击“余额全额支付”完成支付；或点击下列支付方式完成支付。" });
            }
        } else {
            if (num > 0) {
                if (new Number(document.getElementById("balance").innerHTML.substring(1)) == 0) {
                    extra = "￥" + num.toFixed(2);
                } else {
                    extra = "￥" + (new Number(document.getElementById("extra").innerHTML.substring(1)) + new Number(document.getElementById("balance").innerHTML.substring(1))).toFixed(2);
                }
                document.getElementById('extra').innerHTML = extra;
                document.getElementById('pay_tip').innerHTML = "";
                listWords("pay_tip", { style: "color:#29363d;font-size:12px;background-color:#e5f1ff;border:1px #377ba6 solid;", class: "msg_box", innerHTML: "请点击下列支付方式完成支付。" });
            } else {
                //				var containerNode = document.getElementById("extra").parentNode.parentNode;
                //				containerNode.childNodes[0].childNodes[0].nodeValue = "还需支付：";
                //				containerNode.removeChild(containerNode.childNodes[1]);
                //				extra = "￥" + new Number(document.getElementById("total").innerHTML.substring(1)).toFixed(2);
                //				document.getElementById('extra').innerHTML = extra;
                //				document.getElementById('pay_tip').innerHTML = "";
                //				listWords("pay_tip", {style:"color:#29363d;font-size:12px;background-color:#e5f1ff;border:1px #377ba6 solid;", class:"msg_box", innerHTML:"请点击下列支付方式完成支付。"});
                document.getElementById("ballance_pay_button").innerHTML = "";
                document.getElementById("ballance_pay_button").style.display = "none";
                document.getElementById('pay_tip').innerHTML = "";
                listWords("pay_tip", { style: "color:#29363d;font-size:12px;background-color:#e5f1ff;border:1px #377ba6 solid;", class: "msg_box", innerHTML: "请点击下列支付方式完成支付。" });
            }
        }
    }
}

function listWords(id, words) {

    var wordsNode = document.getElementById(id);
    var liNode = document.createElement("li");

    var key;
    for (key in words) {
        if (key == "innerHTML") {
            liNode.innerHTML = words[key];
            continue;
        }
        liNode.setAttribute(key, words[key]);
    }
    wordsNode.appendChild(liNode);
}

//map handled functions
function renderPositionBaidu(id, storename, address, tel, longitude, latitude) {
    //alert(data.name);
    var mapholder = document.getElementById(id);

    mapholder.style.display = "block";

    mapholder.style.width = '270px';
    mapholder.style.height = '270px';

    var details = "<div style='font-family:simsun; font-size:14px;'>" +
        "<div ontouchstart=makePhoneCall(" + tel + ")>" +
        "<label style='color:#0000ff;'><span style='color:#ffae00;'>☎ </span>" + tel + "</label><br/>" +
        "<label style='font-family:simsun; font-size:12px;'>" + address + "</label>" +
        "</div>" +
        "</div>";

    var map = new BMap.Map(id);

    var point = new BMap.Point(longitude, latitude);

    var marker = new BMap.Marker(point);

    var opts = {
        width: 220,     // 信息窗口宽度(220~730)
        height: 80,     // 信息窗口高度(60~650)
        title: "<label style='font-family:simsun; font-weight:bold; font-size:14px;'>" + storename + "</label>"  // 信息窗口标题(supports html tag)
    };

    map.centerAndZoom(point, 13);
    map.addOverlay(marker);

    //var control = {type:BMAP_NAVIGATION_CONTROL_ZOOM};
    //map.addControl(new BMap.NavigationControl(control));

    var infoWindow = new BMap.InfoWindow(details, opts);  // 创建信息窗口对象

    marker.openInfoWindow(infoWindow);
    marker.addEventListener("click", function () {
        this.openInfoWindow(infoWindow);
    });
}

function initLBS() {

    //timeout in milliseconds
    var timeoutVal = 20 * 1000;

    if (navigator.geolocation) {
        alert("supported");
        navigator.geolocation.getCurrentPosition(LBSSuccess,
            LBSFault,
            {
                enableHighAccuracy: true,
                timeout: timeoutVal,
                maximumAge: 0
            });
    }
    else {
        return false;
    }
    return true;
}

function LBSSuccess(position) {
    alert("success called");
    alert(
        "latitude : " + position.coords.latitude + '\n' +
        "longitude : " + position.coords.longitude + '\n' +
        "accuracy : " + position.coords.accuracy + '\n' +
        "altitude : " + position.coords.altitude + '\n' +
        "altitudeAccuracy : " + position.coords.altitudeAccuracy + '\n' +
        "heading : " + position.coords.heading + '\n' +
        "speed : " + position.coords.speed + '\n' +
        "timestamp : " + new Date(position.timestamp) + '\n'
    );

}

function LBSFault(error) {
    alert("fault called");
    switch (error.code) {

        case error.PERMISSION_DENIED:
            alert("用户已禁用LBS");
            //x.innerHTML="User denied the request for Geolocation.";
            break;

        case error.POSITION_UNAVAILABLE:
            alert("LBS信息不可用");
            //x.innerHTML="Location information is unavailable.";
            break;

        case error.TIMEOUT:
            alert("LBS请求超时");
            //x.innerHTML="The request to get user location timed out.";
            break;

        case error.UNKNOWN_ERROR:
            alert("未知错误");
            //x.innerHTML="An unknown error occurred.";
            break;
    }
};

//phone number hidding functions
function editHiddenInput(id) {
    var unhidden_id = id.split('_')[0];
    document.getElementById(id).style.display = "none";
    document.getElementById(unhidden_id).style.display = "inline-block";
}

function doStoreTel(store_tel_num, nums) {

    var pattern = /\W{1}\s{1}/;
    var telNums = nums.split(pattern);
    if (telNums == "" || telNums == null || telNums == undefined) {
        return;
    }
    //var storeTelNumNode = document.getElementById("store_tel_num");

    var storeTelNumNode = document.getElementById(store_tel_num);

    //alert(telNums[0]);
    for (var i = 0; i < telNums.length; i++) {
        var liNode = document.createElement("li");
        var aNode = document.createElement("a");
        aNode.setAttribute("href", "tel:" + telNums[i]);

        var greyLabelNode = document.createElement("label");
        greyLabelNode.setAttribute("class", "dark_grey_14_label");

        greyLabelNode.setAttribute("style", "font-weight:bold;");


        var textNode1;

        if (telNums.length > 1) {
            textNode1 = document.createTextNode("电话 " + (i + 1) + "：");
        } else if (telNums.length == 1) {
            textNode1 = document.createTextNode("电话：");
        }

        greyLabelNode.appendChild(textNode1);

        var blueLabelNode = document.createElement("label");
        blueLabelNode.setAttribute("class", "blue_14_label");

        var textNode2 = document.createTextNode(telNums[i]);
        blueLabelNode.appendChild(textNode2);

        aNode.appendChild(greyLabelNode);
        aNode.appendChild(blueLabelNode);
        liNode.appendChild(aNode);
        storeTelNumNode.appendChild(liNode);
    }
}

//ajax utility function
function doAjax(href) {

    var ajax = new XMLHttpRequest();
    ajax.open("GET", href, true);
    ajax.send();

    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4 && (ajax.status == 200)) {

        }
    };
};

var xmlhttp = loadXMLDoc();

function loadXMLDoc() {
    var xmlhttp = null;
    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    return xmlhttp;
}
var eventsImgs;

function sendRequest(url) {
    xmlhttp.open("get", url, false); //这是个同步请求
    xmlhttp.send(null);
    stateChange();
}

function stateChange() {
    if (xmlhttp.readyState == 4) {
        if (xmlhttp.status == 200) {
            var returnValue = xmlhttp.responseText;
            eventsImgs = eval(returnValue);
        } else {
        }
    }
    else {
        alert("ajax调用失败！");
    }
}

var slideMoveStartX = 0;

var slideMoveEndX = 0;

var slidePicX = 0;

var slidePicW = 320;

var slidePicH = 80;

var numOfSlidePics = 0;

var totalSlidePicsW = 0;

var slideIndicatorH = 3;

var slideIndicatorW = 0;

var slideMoveCounter = 0;

var eventLinkArray = new Array();

var slideMoveToLeft = true;

var autoSlideThreadID;

function initSlide() {
    debugger
    if (eventsImgs == null || eventsImgs == "") {
        document.getElementById("top_advt").style.display = "none";
        return;
    }

    document.getElementById("top_advt").style.display = "block";
    var slideContainerNode = document.getElementById("slide_container");

    slideContainerNode.setAttribute("style", " width:" + slidePicW + "px;height:" + slidePicH + "px;");

    var slideImagesNode = document.createElement("div");
    slideImagesNode.setAttribute("id", "slide_images");

    for (var i = 0; i < eventsImgs.length; i++) {
        var aNode = document.createElement("a");
        var imgNode = document.createElement("img");
        aNode.setAttribute("href", eventsImgs[i].href);
        imgNode.setAttribute("src", eventsImgs[i].src);
        aNode.appendChild(imgNode);
        slideImagesNode.appendChild(aNode);

        numOfSlidePics++;
    }

    totalSlidePicsW = slidePicW * numOfSlidePics;

    slideImagesNode.setAttribute("style", "width:" + totalSlidePicsW + "px;-webkit-transform:translateX(0px);transform:translateX(0px);");

    slideContainerNode.appendChild(slideImagesNode);

    if (eventsImgs.length > 1) {

        slideIndicatorW = (slidePicW / numOfSlidePics).toFixed(0);

        slideImagesNode.addEventListener("touchstart", touchEventSlideStart, false);
        slideImagesNode.addEventListener("touchend", touchEventSlideEnd, false);

        var indicatorBNode = document.createElement("div");
        indicatorBNode.setAttribute("style", "background:#000000;height:" + slideIndicatorH + "px;width:" + slidePicW + "px;position:relative;top:" + (slidePicH - slideIndicatorH) + "px;opacity:0.5");
        var indicatorFNode = document.createElement("div");
        indicatorFNode.setAttribute("id", "slide_indicator");
        indicatorFNode.setAttribute("style", "background:#ed6d00;height:" + slideIndicatorH + "px;width:" + slideIndicatorW + "px;position:relative;top:" + (slidePicH - slideIndicatorH * 2) + "px;left:" + slideIndicatorW * slideMoveCounter + "px;opacity:1.0");

        slideContainerNode.appendChild(indicatorBNode);
        slideContainerNode.appendChild(indicatorFNode);

        initSlideLinks();
        autoSlideThreadID = autoSliding();

    }

    var closeImgNode = document.createElement("img");
    closeImgNode.setAttribute("src", "/images/close.png");
    closeImgNode.setAttribute("class", "close_botton");
    closeImgNode.addEventListener("click", function () {
        closeIt('top_advt', '1');
        //clearTimeout(autoSlideThreadID);
    }, false);
    slideContainerNode.appendChild(closeImgNode);
}


function initSlideLinks() {

    var nodeList = document.getElementById("slide_images").childNodes;

    for (var i = 0; i < nodeList.length; i++) {
        if (nodeList[i].nodeName == "A" || nodeList[i].nodeName == "a") {
            eventLinkArray.push(nodeList[i].href);
        }
    }
}



function autoSliding() {

    document.getElementById("slide_images").setAttribute("style", "width:" + totalSlidePicsW + "px;-webkit-transform:translateX(" + slidePicX + "px" + ");transform:translateX(" + slidePicX + "px" + ");");
    doSlideIndicator(slideIndicatorW * slideMoveCounter);

    if (slideMoveToLeft == true) {
        //move to left
        if (slidePicX <= -(totalSlidePicsW - slidePicW)) {
            //slidePicX = -(totalSlidePicsW - slidePicW);
            slideMoveToLeft = false;
        } else {
            slidePicX = slidePicX - slidePicW;
            slideMoveCounter++;
        }
    } else {
        //move to right
        if (slidePicX >= 0) {
            //slidePicX = 0;
            slideMoveToLeft = true; ;
        } else {
            slidePicX = slidePicX + slidePicW;
            slideMoveCounter--;
        }
    }

    var t = setTimeout(autoSliding, 2000);

    return t;
}

function touchEventSlideStart(event) {
    event.preventDefault();

    //clearTimeout(autoSlideThreadID);

    var touch = event.targetTouches[0];

    slideMoveStartX = touch.screenX;
    document.getElementById("slide_images").addEventListener("touchmove", touchEventSlideMove, false);
}

function touchEventSlideMove(event) {

    event.preventDefault();

    var touch = event.targetTouches[0];

    slideMoveEndX = touch.screenX;

    if (slideMoveStartX > slideMoveEndX) {
        //move to left
        if (slidePicX <= -(totalSlidePicsW - slidePicW)) {
            slidePicX = -(totalSlidePicsW - slidePicW);
            //slideMoveToLeft = false;
        } else {
            slidePicX = slidePicX - slidePicW;
            slideMoveCounter++;
        }

    } else if (slideMoveStartX < slideMoveEndX) {
        //move to right
        if (slidePicX >= 0) {
            slidePicX = 0;
            //slideMoveToLeft = true;
        } else {
            slidePicX = slidePicX + slidePicW;
            slideMoveCounter--;
        }
    }

    document.getElementById("slide_images").removeEventListener("touchmove", touchEventSlideMove, false);
}

function touchEventSlideEnd(event) {

    event.preventDefault();

    if (slideMoveEndX == 0) {
        doHREF(eventLinkArray[slideMoveCounter]);
    } else {

        document.getElementById("slide_images").setAttribute("style", "width:" + totalSlidePicsW + "px;-webkit-transform:translateX(" + slidePicX + "px" + ");transform:translateX(" + slidePicX + "px" + ");");
        doSlideIndicator(slideIndicatorW * slideMoveCounter);
        //slideMoveEndX = 0;
        //autoSlideThreadID = autoSliding();
    }

}

function doSlideIndicator(pos) {
    if (slideMoveCounter == numOfSlidePics - 1) {
        pos = slidePicW - slideIndicatorW;
    }
    document.getElementById("slide_indicator").style.left = pos + "px";
}

//IE does not support transition
function initIEAdvt() {

    if (eventsImgs == null || eventsImgs == "") {
        document.getElementById("top_advt").style.display = "none";
        return;
    }
    document.getElementById("top_advt").style.display = "block";
    slideIndicatorH = 20;
    var slideContainerNode = document.getElementById("slide_container");
    slideContainerNode.setAttribute("style", " width:" + slidePicW + "px;height:" + slidePicH + "px;");
    for (var i = 0; i < eventsImgs.length; i++) {
        var aNode = document.createElement("a");
        var imgNode = document.createElement("img");
        if (i == 0) {
            aNode.setAttribute("style", "display:block;height:80px;");
        } else {
            aNode.setAttribute("style", "display:none;height:80px;");
        }
        aNode.setAttribute("id", "aPic_" + i);
        aNode.setAttribute("href", eventsImgs[i].href);
        imgNode.setAttribute("src", eventsImgs[i].src);
        aNode.appendChild(imgNode);
        slideContainerNode.appendChild(aNode);

        numOfSlidePics++;
    }

    if (eventsImgs.length > 1) {

        slideIndicatorW = (slidePicW / numOfSlidePics).toFixed(0) / 4;

        var indicatorBNode = document.createElement("div");
        indicatorBNode.setAttribute("style", "background:#000000;height:" + slideIndicatorH + "px;width:" + slidePicW + "px;position:relative;top:" + (-20) + "px;opacity:0.5");

        slideContainerNode.appendChild(indicatorBNode);

        for (var i = 0; i < numOfSlidePics; i++) {
            var indicatorFNode = document.createElement("div");
            indicatorFNode.setAttribute("id", "slide_indicator" + "_" + i);

            if (i == numOfSlidePics - 1) {
                indicatorFNode.setAttribute("style", "text-align:center;color:#ffffff;float:right;border-left:1px #ffffff solid;display:inline-block;background:#ed6d00;height:" + slideIndicatorH + "px;width:" + (slideIndicatorW) + "px;position:relative;top:" + (-20 - slideIndicatorH) + "px;left:" + 0 + "px;opacity:1.0");
            } else {
                indicatorFNode.setAttribute("style", "text-align:center;color:#ffffff;float:right;border-left:1px #ffffff solid;display:inline-block;background:transparent;height:" + slideIndicatorH + "px;width:" + (slideIndicatorW) + "px;position:relative;top:" + (-20 - slideIndicatorH) + "px;left:" + 0 + "px;opacity:1.0");
            }

            indicatorFNode.setAttribute("onclick", "showIEAdvtPic(this.id);");

            var textNode = document.createTextNode(-(i - numOfSlidePics));
            indicatorFNode.appendChild(textNode);
            slideContainerNode.appendChild(indicatorFNode);
        }

        slideMoveCounter = -(0 - (numOfSlidePics - 1));

        autoSlideThreadID = ieAutoAnimation();

        var closeImgNode = document.createElement("img");
        closeImgNode.setAttribute("src", "/images/close.png");
        closeImgNode.setAttribute("class", "close_botton");
        closeImgNode.setAttribute("style", "top:-100px;");
        closeImgNode.addEventListener("click", function () {
            closeIt('top_advt', '1');
            //clearTimeout(autoSlideThreadID);
        }, false);
        slideContainerNode.appendChild(closeImgNode);
    } else {
        var closeImgNode = document.createElement("img");
        closeImgNode.setAttribute("src", "/images/close.png");
        closeImgNode.setAttribute("class", "close_botton");
        closeImgNode.setAttribute("style", "top:-80px;");
        closeImgNode.addEventListener("click", function () {
            closeIt('top_advt', '1');
            //clearTimeout(autoSlideThreadID);
        }, false);
        slideContainerNode.appendChild(closeImgNode);
    }


}

function showIEAdvtPic(id) {

    //document.getElementById(id).style.background="#ed6d00";

    var butNum = (id.split("_")).pop();

    var picNum = -(new Number((id.split("_")).pop()) - (numOfSlidePics - 1));

    //alert(picNum);
    for (var i = 0; i < numOfSlidePics; i++) {
        if (i == picNum) {
            document.getElementById("aPic_" + i).style.display = "block";
            //alert(document.getElementById("aPic_" + i).display);
        } else {
            document.getElementById("aPic_" + i).style.display = "none";
            //document.getElementById("slide_indicator" + "_" + i).style.background="transparent";
        }
        if (i == butNum) {
            document.getElementById("slide_indicator" + "_" + i).style.background = "#ed6d00";
        } else {
            document.getElementById("slide_indicator" + "_" + i).style.background = "transparent";
        }
    }
}

function ieAutoAnimation() {
    //slideMoveCounter - (numOfSlidePics - 1));
    var id = "slide_indicator" + "_" + slideMoveCounter;

    showIEAdvtPic(id);

    slideMoveCounter--;

    if (slideMoveCounter < 0) {

        slideMoveCounter = -(0 - (numOfSlidePics - 1));
    }

    var t = setTimeout(ieAutoAnimation, 2000);

    return t;
}

function removeAllChildNodes(parentNode) {

    while (parentNode.hasChildNodes()) {
        parentNode.removeChild(parentNode.childNodes[0]);
    }
}

//loading animation

var animationTimeout;

window.requestAnimFrame = (function (callback) {
    return window.requestAnimationFrame ||
        window.webkitRequestAnimationFrame ||
        window.mozRequestAnimationFrame ||
        window.oRequestAnimationFrame ||
        window.msRequestAnimationFrame ||
        function (callback) {
            animationTimeout = window.setTimeout(callback, 1000 / 60);
        };
})();

var bigBallIndex = 0;
var numOfBalls = 3;
var canvas;
var context;
function initLoadingAnimate(parentID) {
    var parentNode = document.getElementById(parentID);
    canvas = document.createElement("canvas");

    canvas.setAttribute("style", "position:relative; left:0px; top:200px;");
    //canvas.style.left = 20;
    //canvas.style.top = 100;
    canvas.width = 80;
    canvas.height = 80;
    context = canvas.getContext('2d');
    //document.body.appendChild( canvas );
    parentNode.appendChild(canvas);

    hideURLbar();
}

function loadingAnimate() {

    requestAnimFrame(loadingAnimate);

    var time = new Date().getTime();

    var radius = 2.5;

    // update
    if (time % 10 == 0) {
        if (bigBallIndex < numOfBalls) {
            bigBallIndex++;
        } else {
            bigBallIndex = 0;
        }
    }
    // clear
    context.clearRect(0, 0, canvas.width, canvas.height);

    // draw
    for (var i = 0; i < numOfBalls; i++) {

        if (i == bigBallIndex) {
            radius *= 2;
        } else {
            radius = 2.5;
        }
        context.globalAlpha = 1.0;
        context.beginPath();
        context.arc((canvas.width - 20 * 2) / 2 + i * 20, canvas.height / 2 - 15, radius, 0, Math.PI * 2, true);
        context.closePath();
        context.fillStyle = "#ffffff";
        context.fill();
        context.font = "900 18px Arial";
        context.fillText("请 稍 候", (canvas.width - context.measureText("请 稍 候").width) / 2, canvas.height / 2 + 15);
    }
}
//Utilities from Comm.js
function GetCheckCode(imgId, url) {
    var now = new Date();
    var img = document.getElementById(imgId);
    img.src = url + '?rand=' + now.getTime();
}
function doSubFilter(select) {
    doHREF(select.options[select.selectedIndex].value);
}
function onSearch(obj, recode) {
    if (document.getElementById('kw').value == '') {
        alert('请输入关键字');
        return false;
    }
    doRecord('search_record', 30);
}


function onRefundSubmit() {
    var reasons = document.getElementsByName("Reason");
    var reasonSelect = false;
    for (var i = 0; i < reasons.length; i++) {
        if (reasons[i].checked) {
            reasonSelect = true;
            break;
        }
    }
    if (!reasonSelect) {
        alert('请选择退款原因');
        return false;
    } else {
        document.getElementById('form1').submit();
    }
}

//20140102 added for logon.html that supports "mobile number + sms verify code" log on mode -->
//20140102 added for logon.html that supports "mobile number + sms verify code" log on mode -->

function countDownSecond(remainingSecond, callback) {

    overTime = 1000 * remainingSecond;
    nowTime = new Date();
    endTime = new Date(nowTime.getTime() + overTime);

    callback();
    //getRemainingSecond();
}

function getSMSVerifyCode() {

    if (validateInputWithConditions([{
            id: "mobilephone",
            pattern: /^1[3458]\d{9}$/,
            msg: "请输入有效手机号"
        }]) == false) {
        return;
    }

    document.getElementById("smsverifybutton").removeEventListener('click', getSMSVerifyCode, false);
    document.getElementById("smsverifybutton").style.opacity = 0.3;
    countDownSecond(60, setSMSButtonSecond);

    //call ajax method here
    //if not success, popup alert to user
    var phone = document.getElementById("mobilephone").value;
    var href = "MPLogin/MPValidateCode.ashx?mobilephone=" + phone;
    var ajax = new XMLHttpRequest();
    ajax.open("GET", href, true);
    ajax.send();
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4 && ajax.status == 200) {
            if (ajax.responseText.length > 0) {
                var jsonResult = eval('(' + ajax.responseText + ')');
                if (!jsonResult.flag) {
                    alert(jsonResult.error);
                }
            }
        }
    };

}

function setSMSButtonSecond() {

    nowTime = new Date();
    var totalMS = endTime.getTime() - nowTime.getTime();
    var nS = Math.floor(totalMS / 1000) % 60;
    if (totalMS >= 0) {
        document.getElementById("smsverifylabel").innerHTML = nS + "秒后重新获取";
        //document.getElementById("smsverifybutton").value = nS + " 秒后重新获取";
    } else {
        document.getElementById("smsverifybutton").style.opacity = 1.0;
        document.getElementById("smsverifylabel").innerHTML = "获取短信验证码";
        //document.getElementById("smsverifybutton").value = "获取短信验证码";
        document.getElementById("smsverifybutton").addEventListener("click", getSMSVerifyCode, false);
    }
    timeout = setTimeout(setSMSButtonSecond, 100);
}

//conditions -- [{id:"", pattern:"", confirm:"", operator:"", checker:"", msg:""}]
//confirm fomat: msg♥url
function validateInputWithConditions(conditions, callback) {
    for (var i = 0; i < conditions.length; i++) {
        var input = document.getElementById(conditions[i].id);
        var msg = conditions[i].msg;

        var pattern = new RegExp(conditions[i].pattern);

        if (pattern !== undefined || pattern != null) {
            if (!pattern.test(input.value)) {
                alert(msg);
                return false;
            }
        } else {
            var confirm = conditions[i].confirm;
            if (confirm !== undefined || confirm != null) {
                doNaviConfirm(confirm);
                return true;
            }
            var operator = conditions[i].operator;
            if (operator !== undefined || operator != null) {
                var checker = conditions[i].checker;
                switch (operator) {
                    case "==":
                        if (input.value == checker) {
                            alert(msg);
                            return false;
                        }
                        break;
                    case "!=":
                        if (input.value != checker) {
                            alert(msg);
                            return false;
                        }
                        break;
                    case ">=":
                        if (input.value >= checker) {
                            alert(msg);
                            return false;
                        }
                        break;
                    case "<=":
                        if (input.value <= checker) {
                            alert(msg);
                            return false;
                        }
                        break;
                    case ">":
                        if (input.value > checker) {
                            alert(msg);
                            return false;
                        }
                        break;
                    case "<":
                        if (input.value < checker) {
                            alert(msg);
                            return false;
                        }
                        break;
                }
            }

        }

    }
    //document.getElementById(id).submit();
    if (callback !== undefined || callback != null) {
        callback();
    }
    return true;
}
//20140102 added for logon.html that supports "mobile number + sms verify code" log on mode -->
//20140102 added for logon.html that supports "mobile number + sms verify code" log on mode -->