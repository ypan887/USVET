var chart_config
var rowData = $('#collapsable-QA').data('questions');
var config = {
  container: "#collapsable-QA",

  animateOnInit: true,
  
  node: {
      collapsable: true
  },
  animation: {
      nodeAnimation: "easeOutBounce",
      nodeSpeed: 700,
      connectorsAnimation: "bounce",
      connectorsSpeed: 700
  }
};


function toNode(object){
  window[object.name] = { 
    text: {
      name: object.text
    }
  };
};

function addParent(object){
  if(object.parent){
    window[object.name].parent = this[object.parent]
  }; 
  return window[object.name];
};

rowData.forEach(toNode);
data = rowData.map(addParent);
chart_config = [config].concat(data);