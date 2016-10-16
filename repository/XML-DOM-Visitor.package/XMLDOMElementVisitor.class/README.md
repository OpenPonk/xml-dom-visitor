I am a DOM visitor that visits elements and delegates the visition to pluggable `elementVisitor`.

e.g. upon visiting `<ActorRoles>` element the `elementVisitor visitActorRoles:` method will be called.