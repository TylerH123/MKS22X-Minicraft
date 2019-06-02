public class TileXComparator implements Comparator<TestTile>{

    @Override
    public int compare(TestTile t1, TestTile t2) {
       return (t1.x - t2.x);
    }

}
