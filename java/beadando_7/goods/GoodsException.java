package goods;

public class GoodsException extends
IllegalArgumentException {

    public GoodsException() {}

    public GoodsException(String errorCode) {
        super(errorCode);
    }
}