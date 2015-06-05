var svg_gap = d3.select("#funding-gap-chart").append("svg").attr("width", "99%").attr("height", 120);
var funding_data = data_2015_funding.filter(function(d) { return d.id == gha_csv["TCD"].Appeal_ID_2015; })[0];
var gap_collated_data = [{"name": "Requirement", "value": funding_data.current_requirements}, {"name": "Funded", "value": funding_data.funding}];

var gap_width = $(svg_gap[0]).width();
var gap_height = 40;
var gap_padding = 50;

var gap_scale = d3.scale.linear().domain([0, funding_data.current_requirements]).rangeRound([0, gap_width - gap_padding]);

var gap_bars = svg_gap.selectAll("rect.gap-bars").data(gap_collated_data)
                  .enter()
                    .append("rect")
                        .attr("class", "gap-bars")
                        .attr("width", 10)
                        .attr("height", 40)
                        .attr("x", 0)
                        .attr("y", function(d, i) { return (i * 60) + 20; })
                        .style("background-color", "black");

gap_bars.transition()
    .duration(2000)
    .attr("width", function(d) { return gap_scale(d.value); });

var gap_labels = svg_gap.selectAll("text.gap-labels").data(gap_collated_data)
                    .enter()
                        .append("text")
                          .attr("class", "gap-labels")
                          .attr("x", 0)
                          .attr("y", function(d,i) { return (i * 60) +18; })
                          .text(function(d) { return d.name; });

var gap_info_text = svg_gap.selectAll("text.gap-info-text").data(gap_collated_data).enter().append("text").attr("class", "gap-info-text").attr("x", 0).attr("y", function(d,i) { return i * 60 + 50; });

gap_info_text.transition().duration(2000)
  .attr("x", function(d) { return gap_scale(d.value)+2 })
  .tween("text",function(data) {
      var i = d3.interpolateRound(0, parseInt(data.value));
      return function(t) {
        var fmt_pref = d3.formatPrefix(i(t))
        if (fmt_pref.symbol != "k" && i(t) > 1000)
        {
          this.textContent = fmt_pref.scale(i(t)).toFixed(1) + fmt_pref.symbol;
        }
        else {
          this.textContent = fmt_pref.scale(i(t)).toFixed(0) + fmt_pref.symbol;
        }
      };
  });
