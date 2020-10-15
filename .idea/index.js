"use strict";
document.getElementById("technicalError").style.display = "none";
const catagoryUrl = "http://localhost:8080/catagories";
const productUrl = "http://localhost:8080/products/";
const costUrl = "http://localhost:8080/investmentCost/";
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

async function readProductDetailWithUrl(urlProductsDetail) {
    try {
        const response = await fetch(urlProductsDetail);
        if (response.ok) {
            const product = await response.json();
            DescriptionOf(product);
        } else {
            technicalError();
        }
    } catch {
        technicalError();
    }
}
// make nav bar from reading the catagories table
function enterDetailsOf(catagories) {
    var ul = document.getElementById("left").getElementsByTagName("ul")[0];
    for (const catagory of catagories._embedded.catagoryIdNameList) {
        const li = makeLiWith(catagory.name, catagory._links.self.href);
        ul.appendChild(li);
    }
    nav.appendChild(ul);
}
// make list of projects under a catagory
function DetailsOf(productList) {
    var ul = document.getElementsByClassName("middle")[0].getElementsByTagName("ul")[0];
    while (ul.lastChild !== null) { ul.lastChild.remove(); }
    for (const product of productList._embedded.productIdNameList) {
        const li = makeLiForProduct(product.name, product.id);
        ul.appendChild(li);
    }
}
// fill details of the product
function DescriptionOf(product) {
    var dl = document.getElementById("productDetail");
    while (dl.lastChild !== null) { dl.lastChild.remove(); }
    const dt1 = document.createElement("h3");
        dt1.innerText=product.title;
    const dd1 =document.createElement("dd");
        dd1.innerText="";
    dl.appendChild(dt1);
    dl.appendChild(dd1);

    const dt2 =document.createElement("h4");
        dt2.innerText="Introduction";
    const dd2 =document.createElement("dd");
        dd2.innerText=product.description;
    dl.appendChild(dt2);
    dl.appendChild(dd2);

    const dt3 =document.createElement("h4");
        dt3.innerText="Rationale";
    const dd3 =document.createElement("dd");
        dd3.innerText=product.rationale;
    dl.appendChild(dt3);
    dl.appendChild(dd3);

    const dt4 =document.createElement("h4");
        dt4.innerText="Market Potential";
    const dd4 =document.createElement("dd");
        dd4.innerText=product.marketPotential;
    dl.appendChild(dt4);
    dl.appendChild(dd4);

    const dt5 =document.createElement("h4");
        dt5.innerText="Raw Material";
    const dd5 =document.createElement("dd");
        dd5.innerText=product.rawMaterial;
    dl.appendChild(dt5);
    dl.appendChild(dd5);

    const dt6 =document.createElement("h4");
        dt6.innerText="Technology";
    const dd6 =document.createElement("dd");
        dd6.innerText=product.technology;
    dl.appendChild(dt6);
    dl.appendChild(dd6);

    const dt7 =document.createElement("h4");
        dt7.innerText="Benefits";
    const dd7 =document.createElement("dd");
        dd7.innerText=product.benefits;
    dl.appendChild(dt7);
    dl.appendChild(dd7);

    const dt8 =document.createElement("h4");
        dt8.innerText="Investment Cost";
    const dd8 =document.createElement("dd");
    dd8.innerText="";
    dl.appendChild(dt8);
    dl.appendChild(dd8);

    const a =document.createElement("a");
    a.innerText="Calculate";
    a.href="#";
    a.dataset.url = costUrl.concat(product.id.toString());
    a.onclick = function () {
        calculateCost(this.dataset.url);
    };
    dl.append(a);

    /*const dt9 =document.createElement("h4");
    dt9.innerText="Search results";
    const dd9 =document.createElement("dd");
    dd9.innerText="";
    dl.appendChild(dt9);
    dl.appendChild(dd9);*/

}

function technicalError() {
    document.getElementById("technicalError").hidden = false;
}

// make a list of catagorues
function makeLiWith(name, url) {
    const li = document.createElement("li");
    const hyperlink = document.createElement("a");
    hyperlink.innerText = name;
    hyperlink.href = "#";
    hyperlink.dataset.url = url;
    hyperlink.onclick = function () {
        readProductsWithUrl(this.dataset.url);
    };
    li.appendChild(hyperlink);

    return li;
}

// make a list of projects
function makeLiForProduct(name, id) {
    var Url = productUrl.concat(id.toString());
    const li = document.createElement("li");
    const hyperlink = document.createElement("a");
    hyperlink.innerText = name;
    hyperlink.href = "#";
    hyperlink.dataset.url = Url;
    hyperlink.onclick = function () {
        readProductDetailWithUrl(this.dataset.url);
    };
    li.appendChild(hyperlink);

    return li;
}
document.getElementById("keyword").onkeydown=function (){
    var keyword = document.getElementById("keyword").value;
    var url = searchUrl.concat(this.value);
    readProductsWithUrl(url)
}

