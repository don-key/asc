<%@ page contentType="text/html; charset=utf-8" %>

<div id="page-wrapper">
   <div class="gantt">
   
   </div>
</div>

<script>
$(function() {

    "use strict";

    $(".gantt").gantt({
        source: [{
            name: "오늘 쉬는날",
            desc: "Replication - New File for Multi Values",
            values: [{
                from: "/Date(1320192000000)/",
                to: "/Date(1322401600000)/",
                label: "62067",
                customClass: "ganttRed"}]},
        {
            name: " ",
            desc: "Canceled Accounts Comparsion",
            values: [{
                from: "/Date(1322611200000)/",
                to: "/Date(1323302400000)/",
                label: "62069",
                customClass: "ganttRed"}]},
        {
            name: "",
            desc: "Document Replication Flow Chart",
            values: [{
                from: "/Date(1323802400000)/",
                to: "/Date(1325685200000)/",
                label: "62057",
                customClass: "ganttGreen"}]},
        {
            name: " ",
            desc: "Replication Sum Up Account Codes & Delinquencies",
            values: [{
                from: "/Date(1325685200000)/",
                to: "/Date(1325695200000)/",
                label: "62063",
                customClass: "ganttBlue"}]},
        {
            name: "",
            desc: "Rereplicate on OOB for dscontracts",
            values: [{
                from: "/Date(1326785200000)/",
                to: "/Date(1325785200000)/",
                label: "62065",
                customClass: "ganttGreen"}]}],
        navigate: "scroll",
        scale: "weeks",
        maxScale: "months",
        minScale: "days",
        itemsPerPage: 10,
        onItemClick: function(data) {
            alert("Item clicked - show some details");
        },
        onAddClick: function(dt, rowId) {
            alert("Empty space clicked - add an item!");
        },
        onRender: function() {
            if (window.console && typeof console.log === "function") {
                console.log("chart rendered");
            }
        }
    });

});
</script>