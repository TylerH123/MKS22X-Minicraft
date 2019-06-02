public class TileYComparator implements Comparator<TestTile>{

    @Override
    public int compare(TestTile t1, TestTile t2) {
       return (t1.y - t2.y);
    }

}
