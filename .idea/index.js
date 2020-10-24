"use strict";
document.getElementById("technicalError").style.display = "none";
const catagoryUrl = "http://localhost:8080/catagories";
const searchUrl = "http://localhost:8080/search?keyword=";
const textSearchButton = document.getElementById("mainSearch");

readCatagories()

async function readCatagories() {
    try {
        const response = await fetch(catagoryUrl);
        if (response.ok) {
            const catagories = await response.json();
            enterDetailsOf(catagories);
        } else {
            technicalError();
        }
    } catch {
        technicalError();
    }
}

async function readProductsWithUrl(urlProducts,catagory) {
    try {
        const response = await fetch(urlProducts);
        if (response.ok) {
            const productList = await response.json();
            DetailsOf(productList,catagory);
        } else {
            technicalError();
        }
    } catch {
        technicalError();
    }
}

// make nav bar from reading the catagories table
function enterDetailsOf(catagories) {
    var div = document.getElementById("ideas");//.getElementsByTagName("ul")[0];
    for (const catagory of catagories._embedded.catagoryIdNameList) {
        const a = makeHyperlinkWith(catagory.name, catagory._links.self.href);
        div.appendChild(a);
    }
}
// make a list of catagorues
function makeHyperlinkWith(name, url) {
    const hyperlink = document.createElement("a");
    hyperlink.innerText = name;
    hyperlink.href = "ideas.html";
    hyperlink.dataset.url = url;
    hyperlink.classList="dropdown-item";
    hyperlink.onclick = function () {
        sessionStorage.setItem("catagoryUrl",this.dataset.url)
        sessionStorage.setItem("catagoryName",this.innerText)
    };
    return hyperlink;
}

function technicalError() {
    document.getElementById("technicalError").hidden = false;
}
document.getElementById("mainSearch").onclick=function (){
    var keyword = document.getElementById("keyword").value;
    document.searchForm.action = "search.html";
    sessionStorage.setItem('keyword', keyword);
}