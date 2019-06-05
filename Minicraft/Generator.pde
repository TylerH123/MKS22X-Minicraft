public class Generator{
  int[][] data = new int[100][100];
  public Generator(){
    // 0 is gress
    // 1 is stone
    // 2 is tree
    ArrayList<Integer> uniquex = new ArrayList<Integer>();
    ArrayList<Integer> uniquey = new ArrayList<Integer>();
    int seedCounter = 0;

    for(int z = 10; z < 100; z++){
      uniquex.add(z);
      uniquey.add(z);
    }

    Collections.shuffle(uniquex);
    Collections.shuffle(uniquey);

    Random randgen = new Random();
    int noMountains = 10;
    int[][] stoneseeds = new int[noMountains][2];
    // data[stoneseeds[0][0] = abs(randgen.nextInt()%100)] [stoneseeds[0][1] = abs(randgen.nextInt()%100)] = 1;
    // data[stoneseeds[1][0] = abs(randgen.nextInt()%100)] [stoneseeds[1][1] = abs(randgen.nextInt()%100)] = 1;
    // data[stoneseeds[2][0] = abs(randgen.nextInt()%100)] [stoneseeds[2][1] = abs(randgen.nextInt()%100)] = 1;

    for(int x = 0; x < noMountains; x++){
      data[stoneseeds[x][0] = uniquex.get(seedCounter)] [stoneseeds[x][1] = uniquey.get(seedCounter)] = 1;
      seedCounter++;
    }

    for(int seed = 0; seed < noMountains; seed++){
      for(int x = 0; x < 100; x++){
        for(int y = 0; y < 100; y++){
          if ((x - stoneseeds[seed][0]) * (x - stoneseeds[seed][0]) + (y - stoneseeds[seed][1]) * (y - stoneseeds[seed][1]) <= pow(randgen.nextInt(15), 2)) {
            data[x][y] = 1;
          }
        }
      }
    }



    int noForests = 10;
    int[][] forestseeds = new int[noForests][2];
    // data[stoneseeds[0][0] = abs(randgen.nextInt()%100)] [stoneseeds[0][1] = abs(randgen.nextInt()%100)] = 1;
    // data[stoneseeds[1][0] = abs(randgen.nextInt()%100)] [stoneseeds[1][1] = abs(randgen.nextInt()%100)] = 1;
    // data[stoneseeds[2][0] = abs(randgen.nextInt()%100)] [stoneseeds[2][1] = abs(randgen.nextInt()%100)] = 1;

    for(int x = 0; x < noForests; x++){
      data[forestseeds[x][0] = uniquex.get(seedCounter)] [forestseeds[x][1] = uniquey.get(seedCounter)] = 1;
      seedCounter++;
    }

    for(int seed = 0; seed < noForests; seed++){
      for(int x = 0; x < 100; x++){
        for(int y = 0; y < 100; y++){
          if ((x - forestseeds[seed][0]) * (x - forestseeds[seed][0]) + (y - forestseeds[seed][1]) * (y - forestseeds[seed][1]) <= pow(randgen.nextInt(15), 2)) {
            data[x][y] = 2;
          }
        }
      }
    }
  }

}
