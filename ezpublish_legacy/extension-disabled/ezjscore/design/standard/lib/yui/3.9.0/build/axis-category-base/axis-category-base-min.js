/* YUI 3.9.0 (build 5827) Copyright 2013 Yahoo! Inc. http://yuilibrary.com/license/ */
YUI.add("axis-category-base",function(e,t){function n(){}n.NAME="categoryImpl",n.ATTRS={calculateEdgeOffset:{value:!0}},n.prototype={formatLabel:function(e,t){return e},_indices:null,GUID:"yuicategoryaxis",_type:"category",_updateMinAndMax:function(){this._dataMaximum=Math.max(this.get("data").length-1,0),this._dataMinimum=0},_getKeyArray:function(e,t){var n=0,r,i=[],s=[],o=t.length;this._indices||(this._indices={});for(;n<o;++n)r=t[n],i[n]=n,s[n]=r[e];return this._indices[e]=i,s},getDataByKey:function(e){this._indices||this.get("keys");var t=this._indices;return t&&t[e]?t[e]:null},getTotalMajorUnits:function(e,t){return this.get("data").length},getKeyValueAt:function(e,t){var n=NaN,r=this.get("keys");return r[e]&&r[e][t]&&(n=r[e][t]),n}},e.CategoryImpl=n,e.CategoryAxisBase=e.Base.create("categoryAxisBase",e.AxisBase,[e.CategoryImpl])},"3.9.0",{requires:["axis-base"]});
