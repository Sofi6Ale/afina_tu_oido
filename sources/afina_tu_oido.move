module afina_tu_oido::afina_tu_oido {

    // Estructura del reto musical
    public struct DesafioMusical has key, store {
        id: UID,
        nota_correcta: u8,
        respuesta: option::Option<u8>,
        acerto: bool,
    }

    // Crea y transfiere el objeto DesafioMusical
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

    // Permite responder el desafío musical
    public entry fun responder(
        desafio: &mut DesafioMusical,
        respuesta_usuario: u8
    ) {
        desafio.respuesta = option::some(respuesta_usuario);
        desafio.acerto = respuesta_usuario == desafio.nota_correcta;
    }
}