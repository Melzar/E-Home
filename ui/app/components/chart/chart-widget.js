import Ember from 'ember';
import Chart from 'npm:chart.js';
import moment from 'npm:moment';

export default Ember.Component.extend({
  store: Ember.inject.service(),
  id: 'chart',
  unit: null,
  type: null,
  chart_data: null,
  labels: null,
  time: null,
  didInsertElement: function(){
    var ctx = this.$('#'+this.get('id'));
    var labels =  this.get('labels');
    var data = this.get('chart_data');
    var unit = this.get('unit');
    var type = this.get('type');
    var time = this.get('time');
    if (time){
      labels = labels.map(function(item){
        return moment(item).format('dd HH:mm:ss');
      });
    }
    var myChart = new Chart(ctx, {
                    type: type,
                    data: {
                      labels: labels,
                      datasets: [
                        {
                          label: 'Data ',
                          fill: false,
                          lineTension: 0.1,
                          backgroundColor: "rgba(75,192,192,0.4)",
                          borderColor: "rgba(75,192,192,1)",
                          borderCapStyle: 'butt',
                          borderDash: [],
                          borderDashOffset: 0.0,
                          borderJoinStyle: 'miter',
                          pointBorderColor: "rgba(75,192,192,1)",
                          pointBackgroundColor: "#fff",
                          pointBorderWidth: 1,
                          pointHoverRadius: 5,
                          pointHoverBackgroundColor: "rgba(75,192,192,1)",
                          pointHoverBorderColor: "rgba(220,220,220,1)",
                          pointHoverBorderWidth: 2,
                          pointRadius: 1,
                          pointHitRadius: 10,
                          data: data,
                        }
                      ]
                    },

                    options: {
                      legend: {
                        display: false
                      },
                      scales: {
                        yAxes: [{
                          ticks: {
                            userCallback: function(value, index, values) {
                              return value + "  " + unit;
                            }
                          }
                        }]
                      },
                      maintainAspectRatio: false,

                    }
                  });
  }
});
