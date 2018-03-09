package cn.wolfcode.wms.exception;

/**
 * created by king on 2017/12/4
 */
public class StockOutComeBillException  extends RuntimeException{
    public StockOutComeBillException() {
        super();
    }

    public StockOutComeBillException(String message) {
        super(message);
    }

    public StockOutComeBillException(String message, Throwable cause) {
        super(message, cause);
    }
}
