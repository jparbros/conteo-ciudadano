# encoding: UTF-8
class Highchart
  def self.results_percentage
    LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:chart][:defaultSeriesType] = "line"
      f.options[:chart][:borderWidth] = 1
      f.options[:title][:text] = 'Elecciones Presidenciales 2012'
      f.xAxis(:categories => HistoricalResult.xAxis, :labels => {:rotation => -45, :align => 'right'})
      f.yAxis(title: { text: 'Porcentaje de la votación'}, plotLines: [{value: 0, width: 1, color: '#808080'}])
      f.series(:name => 'Josefina Vazquez Mota', :data => HistoricalResult.jvm_results, color: '#045899')
      f.series(:name => 'Enrique Peña Nieto', :data => HistoricalResult.epn_results, color: '#CF3C43')
      f.series(:name => 'Andres Manuel Lopez Obrador', :data => HistoricalResult.amlo_results, color: '#F7B607')
      f.series(:name => 'Gabriel Quadri Torres', :data => HistoricalResult.gqt_results, color: '#0E8291')
      f.series(:name => 'Votos Nulos', :data => HistoricalResult.nulls_results, color: '#cecece')
      f.series(:name => 'Otros Candidatos', :data => HistoricalResult.others_results, color: '#6D45C0')
    end
  end
end