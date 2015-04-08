package kha.networking;

import haxe.io.Bytes;
import haxe.macro.Context;
import haxe.macro.Expr;

class EntityBuilder {
	macro static public function build(): Array<Field> {
		var fields = Context.getBuildFields();
		
		var receive = macro {
			
		};
		
		var send = macro {
			
		};
		
		var index: Int = 0;
		for (field in fields) {
			switch (field.kind) {
			case FVar(t, e):
				var fieldname = field.name;
				switch (t) {
				case TPath(p):
					switch (p.name) {
					case "Int":
						send = macro {
							$send;
							bytes.set($v { index }, this.$fieldname);
						};
						receive = macro {
							$receive;
							this.$fieldname = bytes.get($v { index } );
						};
						index += 4;
					case "Float":
						send = macro {
							$send;
							bytes.setDouble($v { index }, this.$fieldname);
						};
						receive = macro {
							$receive;
							this.$fieldname = bytes.getDouble($v { index } );
						};
						index += 8;
					}
				default:
				}
			default:
			}
		}
		/*
		fields.push({
			name: "_send",
			doc: null,
			meta: [],
			access: [APublic],
			kind: FFun({
				ret: null,
				params: null,
				expr: send,
				args: [ {
					value: null,
					type: Context.toComplexType(Context.getType("haxe.io.Bytes")),
					opt: null,
					name: "bytes"}]
			}),
			pos: Context.currentPos()
		});
		
		fields.push({
			name: "_receive",
			doc: null,
			meta: [],
			access: [APublic],
			kind: FFun({
				ret: null,
				params: null,
				expr: receive,
				args: [ {
					value: null,
					type: Context.toComplexType(Context.getType("haxe.io.Bytes")),
					opt: null,
					name: "bytes"}]
			}),
			pos: Context.currentPos()
		});
		*/
		var newField = {
			name: "_id",
			doc: null,
			meta: [],
			access: [APublic],
			kind: FVar(macro: Int, macro 0),
			pos: Context.currentPos()
		};
		fields.push(newField);
		return fields;
	}
}
