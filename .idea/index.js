"use strict";
document.getElementById("technicalError").style.display = "none";
const catagoryUrl = "http://localhost:8080/catagories";
const searchUrl = "http://localhost:8080/search?keyword=";
const textSearchButton = document.getElementById("mainSearch");
const productUrl = "http://localhost:8080/products/";

var id = Math.floor((Math.random() * 2) + 1);
var urlProducts = catagoryUrl.concat("/").concat(id.toString());

readCatagories()
readProductsWithUrl(urlProducts)

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

// making a least of featured projects
async function readProductsWithUrl(urlProducts) {
    try {
        const response = await fetch(urlProducts);
        if (response.ok) {
            const productList = await response.json();
            DetailsOf(productList);
        } else {
            technicalError();
        }
    } catch {
        technicalError();
    }
}
// make list of projects under a catagory
function DetailsOf(productList) {
    var ul = document.getElementsByClassName("featured")[0].getElementsByTagName("ul")[0];
    while (ul.lastChild !== null) { ul.lastChild.remove(); }
    for (const product of productList._embedded.productIdNameList) {
        const li = makeLiForProduct(product.name, product.id);
        li.dataset.category = product.catagory;
        ul.appendChild(li);
    }
}
// make a list of projects
function makeLiForProduct(name, id) {
    var Url = productUrl.concat(id.toString());
    const li = document.createElement("li");
    const hyperlink = document.createElement("a");
    hyperlink.innerText = name;
    hyperlink.href = "ideas.html";
    hyperlink.dataset.url = Url;
    hyperlink.dataset.id = id;
    hyperlink.onclick = function () {
        sessionStorage.setItem("projectId",this.dataset.id)
    };
    li.appendChild(hyperlink);

    return li;
}