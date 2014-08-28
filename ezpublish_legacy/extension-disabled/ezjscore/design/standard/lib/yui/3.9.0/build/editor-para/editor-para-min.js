/* YUI 3.9.0 (build 5827) Copyright 2013 Yahoo! Inc. http://yuilibrary.com/license/ */
YUI.add("editor-para",function(e,t){var n=function(){n.superclass.constructor.apply(this,arguments)},r="host",i="body",s="nodeChange",o="parentNode",u=i+" > p",a="p",f="<br>",l="firstChild",c="li";e.extend(n,e.Plugin.EditorParaBase,{_onNodeChange:function(t){var n=this.get(r),s=n.getInstance(),h,p,d,v,m,g=s.EditorSelection.DEFAULT_BLOCK_TAG,y,b,w,E,S,x,T,N,C,k,L,A,O,M,_,D,H=":last-child",B,j,F,I,q,R=!1,U;switch(t.changedType){case"enter-up":B=this._lastPara?this._lastPara:t.changedNode,j=B.one("br.yui-cursor"),this._lastPara&&delete this._lastPara,j&&(j.previous()||j.next())&&j.ancestor(a)&&j.remove(),B.test(g)||(C=B.ancestor(g),C&&(B=C,C=null));if(B.test(g)){k=B.previous();if(k){I=k.one(H);while(!R)I?(q=I.one(H),q?I=q:R=!0):R=!0;I&&n.copyStyles(I,B)}}break;case"enter":e.UA.webkit&&t.changedEvent.shiftKey&&(n.execCommand("insertbr"),t.changedEvent.preventDefault()),t.changedNode.test("li")&&!e.UA.ie&&(h=s.EditorSelection.getText(t.changedNode),h===""&&(d=t.changedNode.ancestor("ol,ul"),F=d.getAttribute("dir"),F!==""&&(F=' dir = "'+F+'"'),d=t.changedNode.ancestor(s.EditorSelection.BLOCKS),v=s.Node.create("<p"+F+">"+s.EditorSelection.CURSOR+"</p>"),d.insert(v,"after"),t.changedNode.remove(),t.changedEvent.halt(),m=new s.EditorSelection,m.selectNode(v,!0,!1)));if(e.UA.gecko&&n.get("defaultblock")!=="p"){d=t.changedNode;if(!d.test(c)&&!d.ancestor(c)){d.test(g)||(d=d.ancestor(g)),v=s.Node.create("<"+g+"></"+g+">"),d.insert(v,"after"),m=new s.EditorSelection;if(m.anchorOffset){y=m.anchorNode.get("textContent"),p=s.one(s.config.doc.createTextNode(y.substr(0,m.anchorOffset))),b=s.one(s.config.doc.createTextNode(y.substr(m.anchorOffset))),E=m.anchorNode,E.setContent(""),S=E.cloneNode(),S.append(b),x=!1,N=E;while(!x)N=N.get(o),N&&!N.test(g)?(T=N.cloneNode(),T.set("innerHTML",""),T.append(S),w=N.get("childNodes"),U=!1,w.each(function(e){U&&T.append(e),e===E&&(U=!0)}),E=N,S=T):x=!0;b=S,m.anchorNode.append(p),b&&v.append(b)}v.get(l)&&(v=v.get(l)),v.prepend(s.EditorSelection.CURSOR),m.focusCursor(!0,!0),h=s.EditorSelection.getText(v),h!==""&&s.EditorSelection.cleanCursor(),t.changedEvent.preventDefault()}}break;case"keyup":e.UA.gecko&&s.config.doc&&s.config.doc.body&&s.config.doc.body.innerHTML.length<20&&(s.one(u)||this._fixFirstPara());break;case"backspace-up":case"backspace-down":case"delete-up":e.UA.ie||(L=s.all(u),O=s.one(i),L.item(0)&&(O=L.item(0)),A=O.one("br"),A&&(A.removeAttribute("id"),A.removeAttribute("class")),p=s.EditorSelection.getText(O),p=p.replace(/ /g,"").replace(/\n/g,""),_=O.all("img"),p.length===0&&!_.size()&&(O.test(a)||this._fixFirstPara(),M=null,t.changedNode&&t.changedNode.test(a)&&(M=t.changedNode),!M&&n._lastPara&&n._lastPara.inDoc()&&(M=n._lastPara),M&&!M.test(a)&&(M=M.ancestor(a)),M&&!M.previous()&&M.get(o)&&M.get(o).test(i)&&(t.changedEvent.frameEvent.halt(),t.preventDefault())),e.UA.webkit&&t.changedNode&&(t.preventDefault(),O=t.changedNode,O.test("li")&&!O.previous()&&!O.next()&&(h=O.get("innerHTML").replace(f,""),h===""&&O.get(o)&&(O.get(o).replace(s.Node.create(f)),t.changedEvent.frameEvent.halt(),s.EditorSelection.filterBlocks())))),e.UA.gecko&&(v=t.changedNode,D=s.config.doc.createTextNode(" "),v.appendChild(D),v.removeChild(D))}e.UA.gecko&&t.changedNode&&!t.changedNode.test(g)&&(M=t.changedNode.ancestor(g),M&&(this._lastPara=M))},initializer:function(){var t=this.get(r);if(t.editorBR){e.error("Can not plug EditorPara and EditorBR at the same time.");return}t.on(s,e.bind(this._onNodeChange,this))}},{NAME:"editorPara",NS:"editorPara",ATTRS:{host:{value:!1}}}),e.namespace("Plugin"),e.Plugin.EditorPara=n},"3.9.0",{requires:["editor-para-base"]});
