define [
  'Underscore',
  'libs/namespace',
  'Three',
], (_) ->
  #"use strict"

  namespace "Next.objects",
    Bird: class Bird extends THREE.Object3D
      constructor: (@speed = 1.2) ->
        super
        @time = 0
        @createGeometry()
        @mat = new THREE.MeshBasicMaterial( { color: 0xffffff, emissive: 0x888888, side: THREE.DoubleSide } )
        @side1 = new THREE.Object3D()
        @add(@side1)

        @side2 = new THREE.Object3D()
        @add(@side2)

        # left
        @object2 = new THREE.Mesh( @plane, @mat )
        @object2.position.x = 35
        @object2.rotation.x = -Math.PI * 0.5
        @side1.add(@object2)

        @object = new THREE.Mesh( @tri, @mat )
        @object.position.x = 35
        @object.position.y = 50
        @object.rotation.x = Math.PI * 0.5
        @object2.add(@object)

        # right
        @object3 = new THREE.Mesh( @plane, @mat )
        @object3.position.x = -35
        @object3.rotation.x = -Math.PI * 0.5
        @side2.add(@object3)

        @object4 = new THREE.Mesh( @tri, @mat )
        @object4.position.x = -35
        @object4.position.y = 50
        @object4.rotation.x = Math.PI * 0.5
        @object3.add(@object4)

      update: (delta) =>
        @time += delta * 12
        @side1.position.y = (Math.sin(@time * 0.3 * @speed) + Math.PI - 0.2) * 10
        @side2.position.y = @side1.position.y
        @side1.rotation.z = Math.sin(@time * 0.3 * @speed) * 0.4 + 0.1
        @object.rotation.z = Math.sin(@time * 0.3 * @speed + Math.PI + 0.3) * 0.5 - 0.3
        @side2.rotation.z = Math.sin(@time * 0.3 * @speed) * -0.4 - 0.1
        @object4.rotation.z = Math.sin(@time * 0.3 * @speed + Math.PI + 0.3) * -0.5 + 0.3 + Math.PI

      createGeometry: () =>
        @tri = new THREE.Geometry()
        @tri.vertices.push(new THREE.Vector3(0,0,0))
        @tri.vertices.push(new THREE.Vector3(0,0,100))
        @tri.vertices.push(new THREE.Vector3(150,0,-42))
        @tri.dynamic = false

        @tri.faces.push( new THREE.Face3( 0, 1, 2 ) )
        @tri.computeFaceNormals()

        @plane = new THREE.PlaneGeometry(70,100)
        @plane.dynamic = false
