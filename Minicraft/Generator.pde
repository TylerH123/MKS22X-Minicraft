public class Generator{
  int[][] data = new int[100][100];
  public Generator(){
    // 0 is gress
    // 1 is stone
    // 2 is tree
    Random randgen = new Random();
    int[][] stoneseeds = new int[3][2];
    data[stoneseeds[0][0] = randgen.nextInt()%100][stoneseeds[0][1] = randgen.nextInt()%100] = 1;
    data[stoneseeds[1][0] = randgen.nextInt()%100][stoneseeds[1][1] = randgen.nextInt()%100] = 1;
    data[stoneseeds[2][0] = randgen.nextInt()%100][stoneseeds[2][1] = randgen.nextInt()%100] = 1;

    for(int seed = 0; seed < 3; seed++){
      for(int x = 0; x < 100; x++){
        for(int y = 0; y < 100; y++){
          if ((x - stoneseeds[seed][0]) * (x - stoneseeds[seed][0]) + (y - stoneseeds[seed][1]) * (y - stoneseeds[seed][1]) <= 25){
            data[x][y] = 1;
          }
        }
      }
    }
  }

}
