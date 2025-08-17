module afina_tu_oido::afina_tu_oido {

    public struct DesafioMusical has key, store {
        id: UID,
        nota_correcta: u8,
        respuesta: option::Option<u8>,
        acerto: bool,
    }

    public entry fun crear_y_transferir(ctx: &mut TxContext) {
        let id = object::new(ctx);
        let desafio = DesafioMusical {
            id,
            nota_correcta: 3,
            respuesta: option::none<u8>(),
            acerto: false,
        };
        transfer::public_share_object(desafio);
    }

    public entry fun responder(
        desafio: &mut DesafioMusical,
        respuesta_usuario: u8
    ) {
        desafio.respuesta = option::some(respuesta_usuario);
        desafio.acerto = respuesta_usuario == desafio.nota_correcta;
    }

    public fun fue_acertado(desafio: &DesafioMusical): bool {
        desafio.acerto
    }

    public fun obtener_respuesta(desafio: &DesafioMusical): option::Option<u8> {
        desafio.respuesta
    }

    public fun cambiar_nota_correcta(desafio: &mut DesafioMusical, nueva_nota: u8) {
        desafio.nota_correcta = nueva_nota;
    }
}