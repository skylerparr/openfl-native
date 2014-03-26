package flash.net;
#if cpp


import flash.events.DataEvent;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.ProgressEvent;
import flash.events.IOErrorEvent;
import flash.net.Socket;

class XMLSocket extends EventDispatcher {


	public var connected(get, null):Bool;
	public var timeout:Int;

	private var _socket:Socket;

	private function get_connected(): Bool {
	     if(_socket == null) {
		return false;
	     }
             return _socket.connected;
	}

	public function new(host:String = null, port:Int = 80):Void {

		super();

		if (host != null) {

			connect(host, port);

		}

	}


	public function close():Void {

		_socket.removeEventListener(Event.CONNECT, onOpenHandler);
		_socket.removeEventListener(ProgressEvent.SOCKET_DATA, onMessageHandler);
		_socket.removeEventListener(Event.CLOSE, onSocketClosed);
		_socket.removeEventListener(IOErrorEvent.IO_ERROR, onIOError);

		_socket.close();

	}


	public function connect(host: String, port:Int):Void {
		_socket = new Socket();
		_socket.connect(host, port);
		_socket.addEventListener(Event.CONNECT, onOpenHandler);
		_socket.addEventListener(ProgressEvent.SOCKET_DATA, onMessageHandler);
		_socket.addEventListener(Event.CLOSE, onSocketClosed);
		_socket.addEventListener(IOErrorEvent.IO_ERROR, onIOError);

	}


	public function send(object:Dynamic):Void {
		_socket.writeUTFBytes(object);
		_socket.writeByte(0);

	}

	// Event Handlers
	private function onMessageHandler(e: ProgressEvent):Void {

		dispatchEvent(new DataEvent(DataEvent.DATA, false, false, _socket.readUTFBytes(_socket.bytesAvailable)));

	}

	private function onSocketClosed(e: Event):Void {
	    dispatchEvent(e);
	}

	private function onIOError(e: IOErrorEvent):Void {
	    dispatchEvent(e);
	}

	private function onOpenHandler(_):Void {
		connected = true;
		dispatchEvent(new Event(Event.CONNECT));
		
	}
	
	
}


#end
