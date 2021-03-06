define [
  'Underscore',
  'libs/namespace',
  'cs!core/objects/BuildingBlock',
  'Three',
], (_) ->
  #### Tree

  namespace "Next.objects",
    Tree: class Tree extends THREE.Geometry
      constructor: (@plane, @material2) ->
        super
        @trunkHeight = (27 + Math.random() * 10) / 1.5
        @trunkWidth = (3 + Math.random() * 2) / 1.5
        @leavesRadius = (30 + Math.random() * 10) / 1.5
        @buildTrunk()
        @buildLeaves()

      buildTrunk: () =>
        # simply two planes forming a x
        trunk = new THREE.Mesh( @plane, @material2 )
        trunk.scale.set(@trunkWidth, @trunkHeight, 1)
        trunk.position.y = @trunkHeight / 2
        THREE.GeometryUtils.merge(this, trunk)

        trunk2 = new THREE.Mesh( @plane, @material2 )
        trunk2.scale.set(@trunkWidth, @trunkHeight, 1)
        trunk2.rotation.y = Math.PI * 0.5
        trunk2.position.y = @trunkHeight / 2
        THREE.GeometryUtils.merge(this, trunk2)

      buildLeaves: () =>
        leavesCount = 50
        leafSizeMin = 1
        halfRadius = @leavesRadius / 2
      	# lots of planes
        for num in [0..leavesCount]
          leaf = new THREE.Mesh( @plane, @material2 )
          leaf.scale.set(leafSizeMin + Math.random() * 7, leafSizeMin + Math.random() * 7, 1)
          leaf.rotation.set(Math.random() * 10, Math.random() * 10, Math.random() * 10)
          leaf.position.set(-halfRadius + Math.random() * @leavesRadius, @trunkHeight - 5 + Math.random() * @leavesRadius, -halfRadius + Math.random() * @leavesRadius )
          THREE.GeometryUtils.merge(this, leaf)
