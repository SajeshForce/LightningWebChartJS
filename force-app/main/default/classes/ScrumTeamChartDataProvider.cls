global inherited sharing  class ScrumTeamChartDataProvider extends ChartDataProvider {
    Map<String,ResourceAllocationRecoGenerator.ResourceShortage> mp = null;
  /*******************************************************************************************************
   * @description serve as an additional constructor when the classes are instanciated with type forName
   * @param initParameter any data structure the subclass requires
   */
    global override void init(final Object initParameter) {
        mp = ResourceAllocationRecoGenerator.getShortages(initParameter.toString());
    }

  /*******************************************************************************************************
   * @description allow to get the data from the real sub class
   * @return List<ChartData> the list of chart data needed to display the graph
   */
    global override List<ChartData> getData(){
       List<ChartData> datalist= new List<ChartData>();
       ChartData data = new ChartData(); 
       data.labels =new List<String>(); 
       data.detail =new List<Integer>();   
       
        for(ResourceAllocationRecoGenerator.ResourceShortage rs: mp.values()){
             data.labels.add(rs.level);
             data.detail.add(rs.count);
        }
       datalist.add(data);
       return datalist;
           
    }
}